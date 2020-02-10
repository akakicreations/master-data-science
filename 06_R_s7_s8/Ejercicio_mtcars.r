############ Ejemplo con mtcars
#The data was extracted from the 1974 Motor Trend US magazine, 
#and comprises fuel consumption and 10 aspects of automobile design 
#and performance for 32 automobiles (1973–74 models)

data(mtcars)
head(mtcars)
View(mtcars)
str(mtcars)


# mpg: Miles/(US) gallon
# cyl: Number of cylinders
# disp: Displacement (cu.in.)
# hp: Gross horsepower
# drat: Rear axle ratio
# wt: Weight (1000 lbs)
# qsec: 1/4 mile time
# vs: V/S
# am: Transmission (0 = automatic, 1 = manual)
# gear: Number of forward gears
# carb: Number of carburetors

? mtcars

############################################################
# Q1: Cuántos modelos tenían 4 cilindros? Qué modelos eran?
############################################################
length(mtcars$cyl[mtcars$cyl==4])
rownames(mtcars)[mtcars$cyl==4]


############################################################
# Q2: Qué modelos tenían más de 4 cilindros?
############################################################
length(mtcars$cyl[mtcars$cyl>4])

############################################################
# Q3: De esos, cuántos modelos tenían transmision automática? 
############################################################
length(mtcars[mtcars$cyl==4 & mtcars$am==0,"cyl"])
rownames(mtcars)[mtcars$cyl>4 & mtcars$am==0]
############################################################
# Q4: Cuál era el consumo medio de los coches de mas de 4 
#cilindros con transmision automatica? 
############################################################
mean(mtcars$mpg[mtcars$cyl>4 & mtcars$am==0])

############################################################
# Q5: Y de los de transmision manual?
############################################################
mean(mtcars$mpg[mtcars$cyl>4 & mtcars$am==1])

############################################################
# Q6: Dibuja boxplots para ver si la diferencia entre automaticos
# y manuales (en gral) es significativa
############################################################
boxplot(mtcars$mpg ~factor(mtcars$am))

boxplot(mpg ~factor(am),data=mtcars[mtcars$cyl>4,])

