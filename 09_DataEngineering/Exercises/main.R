library(logging)
basicConfig()

source('config.R')

addHandler(writeToFile, file= 'testing.log', level= 'DEBUG')
source('get_data.R')


loginfo('test %d: Llamada a main ejecutada', 1)