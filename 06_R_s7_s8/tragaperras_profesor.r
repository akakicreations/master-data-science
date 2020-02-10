################################################3
#   define function get_symbols
# arguments: 
#           wheel vector with...
#
################################################
get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

score<-function(x){
  same<-x[1]==x[2]&x[1]==x[3]
  bars<-sum(x %in% c("B","BB","BBB"))
  nc<-sum(x=="C")
    
  if(same & x[1]!=0){
    payout=c("DD"=100,"7"=80,"BBB"=40,"BB"=25,"B"=10,"C"=10)
    puntos<-unname(payout[x[1]])
  }else if(bars==3 & !same){
    puntos<-5
  }else{
    payout.cherry<-c(0,2,5)
    puntos<-payout.cherry[nc+1]
  }
  
  if (puntos>0){
    print(paste("Premio",puntos,sep=":"))
  }else{
      print("No Premio")
    }
  return(puntos)
}

play<-function(){
  symbols<-get_symbols()
  print(symbols)
  puntos<-score(symbols)
  return(puntos)
}





