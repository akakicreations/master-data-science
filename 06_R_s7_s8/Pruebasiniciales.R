a<-8*45
b = 34

throw <- function(dado){
  dado<-rep(1,6)
  return(sample(dado, 1))
  
}   


shuffle <- function(introbaraja){
  return(baraja[sample(1:40, 40),])
}

shuffle2 <- function(){
  barajaS<- baraja[sample(1:40, 40),]
  return(barajaS)
}

baraja.shuffled <- shuffle2()

deal<- function(){
  barajaS <- shuffle(baraja)
  return(barajaS[1,])
}


baraja3 <- baraja

baraja3[baraja3$numero == 3] <- baraja3[baraja3$numero = 0]

baraja3[baraja3[3 %in% baraja$numero],]


baraja3$palo == O





