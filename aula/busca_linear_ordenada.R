rm(list = ls())

# busca linear ordenada
busca_linear_ordenada <- function(A, n, k) {
  for (i in 1:n) {
    inicio <- Sys.time()
    if(A[i] == k) {
      fim <- Sys.time()
      return(i)
    } else {
      break
    }
  }
  fim <- Sys.time()
  tempo_total <- difftime(fim, inicio, units = "secs")
  print(tempo_total)
  return(-1)
}