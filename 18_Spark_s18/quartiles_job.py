from __future__ import print_function
from pyspark.sql import types, functions, SparkSession
import sys
 
def zipsort(a, b):
    return sorted(zip(a, b))
 
def quartiles(histogram):
    area = 0
    result = []
 
    for value, percentage in histogram:
        if area == 0:
            result.append(value)
        elif area <= .25 and area + percentage > .25:
            result.append(value)
        elif area <= .5 and area + percentage > .5:
            result.append(value)
        elif area <= .75 and area + percentage > .75:
            result.append(value)
        area += percentage
 
    result.append(value)
    return result
 
if __name__=='__main__':
 
    file = sys.argv[1]
    out = sys.argv[2]
 
    spark = SparkSession.builder.getOrCreate()
    df = spark.read.csv(file, header= True, inferSchema=True)
    df = df.select(['FlightDate', 'DayOfWeek', 'Reporting_Airline', 'Tail_Number', 'Flight_Number_Reporting_Airline', 'Origin', 
                    'OriginCityName', 'OriginStateName', 'Dest', 'DestCityName', 'DestStateName',
                    'DepTime', 'DepDelay', 'AirTime', 'Distance'])
 
    df2 = df.withColumn('Hour', (df['DepTime'] / 100).cast(types.IntegerType()))
    totals = df2.groupBy('Hour').count()
    distributions = df2.groupBy(['Hour', 'DepDelay']).count()
    annotated = distributions.join(totals, on='Hour')
    frequencies = annotated.withColumn('relative', distributions['count'] / totals['count'])
    groups = frequencies.groupBy(totals['Hour'])\
                        .agg(functions.collect_list('DepDelay').alias('delays'),
                             functions.collect_list('relative').alias('relatives'))
 
 
 
    zipsort_typed = functions.udf(zipsort, types.ArrayType(types.ArrayType(types.FloatType())))
    distributions = groups.withColumn('distributions', zipsort_typed('delays', 'relatives'))
 
 
 
    quartiles_udf = functions.udf(quartiles, returnType=types.ArrayType(types.FloatType()))
 
    result = distributions.select('Hour',
                                  quartiles_udf('distributions').alias('quartiles'))
 
    result.write.json(out)
    spark.stop()
