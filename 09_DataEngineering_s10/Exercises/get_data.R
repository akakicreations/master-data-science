data_wine <- read.csv(FILE_INPUT, sep = '\t')
assert_that(ncol(data_wine) == 14, msg = "Cuidado! No hay las mismas columnas")

# Así se comprueba que tiene las mismas columnas, y si no las tiene para la ejecución total
loginfo('test %d: Cargado el csv', 1)

data_alcohol_high <- data_wine[data_wine$Alcohol > 12,]
loginfo('test %d: Seleccionos datos mayores que 12 en alcohol', 1)

write.csv(data_alcohol_high, file= FILE_OUTPUT)
loginfo('test %d: Guardar datos en archivo local', 1)