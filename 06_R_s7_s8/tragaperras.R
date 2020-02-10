
## Definimos wheel and probs
wheel <- c('D', '7','BBB', 'BB', 'B', 'C', 'Nada')
wheel_prob <- c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52)
names(wheel_prob) = wheel # asigno nombres a las probabilidades para que esté más claro

## Creamos la función de hacer tirada
get_symbols <- function(wheel, wheel_prob){
  tirada <- sample(wheel, replace = T, size = 3, prob = wheel_prob)
  return(tirada)
}

##Creamos la función de mostrar premio
score <- function(tirada){
  equal <- tirada[1] == tirada[2] & tirada[1] == tirada[3] #Para los primeros premcios que tienen que salir los tres iguales
  bars <- all( tirada %in% c('BBB', 'BB', 'B'))
  cherries <- sum(tirada == 'C') #No funciona esto!!!!
  
  if(equal & tirada[1] !="Nada"){ #Teniendo en cuenta que los tres sean símbolo Nada
    prize <- 10
    if (tirada[1] == 'DD'){
      prize<- 100
    }else if(tirada[1] == '7'){
      prize <- 80
    }else if(tirada[1] == 'BBB'){
      prize <- 40
    }else if(tirada[1] == 'BB'){
      prize <- 25
    }else if(tirada[1] == 'B'){
      prize <- 10
    }else if(cherries == 2){
      prize <- 5
    }else if(cherries == 1){
      prize <- 2
    }else{
      prize<-10
    }
    print <- (paste('Congrats!', prize))
    
    
  }else if (bars){
    prize<- 5
    print <- (paste('Congrats!', prize))
  }else{
    print('No prize')
    prize <- 0
  }
  return(prize)
}

## Función FINAL
play <- function(){
  tirada <- get_symbols(wheel, wheel_prob)
  print(tirada)
  prize <- score(tirada)
  return(prize)
}
play()
