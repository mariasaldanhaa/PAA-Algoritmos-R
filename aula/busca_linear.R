rm(list = ls())

#busca linear nao ordenada
busca_linear <- function(A, n, k) {
  inicio <- Sys.time()
  
  for(i in 1:n) {
    if(A[i] == k) {
      fim <- Sys.time()
      return(1)
    } else {
      break
    }
  }
  fim <- Sys.time()
  tempo_total <- difftime(fim, inicio, units = "secs")
  return(-1)
  print(tempo_total)
}