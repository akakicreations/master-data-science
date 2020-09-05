#################################################################
# RWANDA ggplot2
#################################################################

# Loading data from the WDB web using an API
install.packages('WDI')
library(WDI)

WDIsearch(string = "life.*expectancy", field = "name", cache = NULL)

df_le <- WDI(country = "all", indicator = c("SP.DYN.LE00.IN"), start = 1900, 
            end = 2012)
head(df_le)
is.data.frame(df_le)
levels(factor(df_le$country)) #Para ver todos los valores 
levels(factor(df_le$year)) #Para ver todos los valores 

library(ggplot2)
g = ggplot() + geom_boxplot(data = df_le, aes(x = year,
                                              y = SP.DYN.LE00.IN, 
                                              group = year))

g = g + theme(axis.text.x = element_text(angle = 45, hjust = 1))
g

? geom_boxplot

subset(df_le, year > 1988 & SP.DYN.LE00.IN < 40)
#Nos da aquellos países que la esperanza de vida es menor que 40

g = g + geom_line(data = subset(df_le, country == "Rwanda"), aes(x = year, y = SP.DYN.LE00.IN), 
                  col = "red")
g
#Para ver si coincide con el patrón general, la evolución de Ruanda

g = g + geom_line(data = subset(df_le, country == "Sierra Leone"), aes(x = year, y = SP.DYN.LE00.IN), 
                  col = "orange")
g
#idem para Sierra Leona, como se ve, vamos añadiendo al gráfico

# H01: Genocide > 1994 x
# H02: AIDS epidemy also in Kenya, South Africa, Uganda, etc

g = g + geom_line(data = subset(df_le, country =="Kenya"), aes(x = year, y = SP.DYN.LE00.IN), 
                  col = "green")
g

g = g + geom_line(data = subset(df_le, country =="South Africa"), aes(x = year, y = SP.DYN.LE00.IN), 
                  col = "green")
g

g = g + geom_line(data = subset(df_le, country =="Uganda"), aes(x = year, y = SP.DYN.LE00.IN), 
                  col = "green")
g

#H03: Civil War
g = g + geom_line(data = subset(df_le, country =="Bangladesh"), aes(x = year, y = SP.DYN.LE00.IN), 
                  col = "blue")
g

g = g + geom_line(data = subset(df_le, country =="Iraq"), aes(x = year, y = SP.DYN.LE00.IN), 
                  col = "red")
g

g = g + geom_line(data = subset(df_le, country =="Iran, Islamic Rep."), aes(x = year, y = SP.DYN.LE00.IN), 
                  col = "red",lty=2)
g

g = g + geom_line(data = subset(df_le, country =="Afghanistan"), aes(x = year, y = SP.DYN.LE00.IN), 
                  col = "violet")
g

g = g + geom_line(data = subset(df_le, country =="Cambodia"), aes(x = year, y = SP.DYN.LE00.IN), 
                  col = "pink")
g
