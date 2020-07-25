from pyspark.sql import SparkSession
from pyspark.sql import types, functions
from pyspark.ml.feature import StringIndexer
from pyspark.ml.feature import OneHotEncoderEstimator
from pyspark.ml.pipeline import Pipeline
from pyspark.ml.feature import VectorAssembler
from pyspark.ml.classification import RandomForestClassifier

import sys


file = sys.argv[1]
out = sys.argv[2]
 
spark = SparkSession.builder.getOrCreate()

columns_of_interest = ['Year', 'Month', 'DayofMonth', 'DayOfWeek', 'Reporting_Airline', 
                       'Tail_Number', 'Flight_Number_Reporting_Airline', 'Origin', 
                       'OriginCityName', 'OriginStateName', 'Dest', 'DestCityName', 'DestStateName',
                       'DepTime', 'DepDelay', 'AirTime', 'Distance']


flights = spark.read.csv(file, header=True, inferSchema=True)
flights = flights[columns_of_interest]
flights_nonas = flights.na.drop()

my_udf = functions.udf(lambda x: x // 100, returnType=types.IntegerType())

with_hours = flights_nonas.withColumn('DepHour', my_udf('DepTime'))

delays = with_hours.withColumn('Delayed', (with_hours['DepDelay'] > 15).cast(types.IntegerType()))

categorical_fields = ['Year', 'Month', 'DayofMonth', 'DayOfWeek', 'Reporting_Airline', 
                      'Origin', 'OriginCityName', 'OriginStateName', 
                      'Dest', 'DestCityName', 'DestStateName']
 
string_fields = [field.name for field in delays.schema.fields if field.dataType == types.StringType()]
 
continuous_fields = ['Distance', 'DepHour']
 
target_field = 'Delayed'

indexers = [ StringIndexer(inputCol=field, outputCol=field + 'Index', handleInvalid='keep') for field in string_fields ]
nonstrings = [ field for field in categorical_fields if field not in string_fields ]
inputs = nonstrings
outputs = [ field + 'OneHot' for field in nonstrings ]

inputs.extend([ field + 'Index' for field in string_fields])
outputs.extend([ field + 'OneHot' for field in string_fields])

encoder = OneHotEncoderEstimator(inputCols=inputs, outputCols=outputs, handleInvalid='keep')

assembler = VectorAssembler(inputCols=outputs, outputCol='features')
rf = RandomForestClassifier(featuresCol='features', labelCol='Delayed' )

my_first_pipeline = Pipeline(stages=indexers + [encoder] + [assembler] + [rf])
pipeline_model = my_first_pipeline.fit(delays)

predictions = pipeline_model.transform(delays)

predictions.write.csv(out)
spark.stop()
