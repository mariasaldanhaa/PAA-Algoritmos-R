rm(list = ls())

#-------- Versão original --------
soma_par_original <- function(A, k){
  n <- length(A)
  for(i in 1:(n-1)) {
    for(j in (i+1):n) {
      if(A[i] + A[j] == k) {
        return(c(i, j))
      }
    }
  }
  return(c(-1, -1))
}

#-------- Versão modificada --------
soma_par_melhorado <- function(A, k) {
  dicionario <- list()
  n <- length(A)
  for(i in 1:n) {
    complemento <- k - A[i]
    if(as.character(complemento) %in% names(dicionario)) {
      return(c(dicionario[[as.character(complemento)]], i))
    }
    dicionario[[as.character(A[i])]] <- i
  }
  return(c(-1, -1))
}

set.seed(123)
n <- 100000
k <- 10
A <- sample(11:1000, n, replace = TRUE)

# verificar se os algoritmos funcionam com um vetor pequeno
teste <- c(3, 5, 2, 8, 4)
cat("  Original (k=10):", soma_par_original(teste, 10), "\n")
cat("  Melhorado (k=10):", soma_par_melhorado(teste, 10), "\n\n")

#-------- Executar 30 rodadas --------
tempos_original <- c()
tempos_melhorado <- c()

for(rodada in 1:30){
  
  # Algoritmo original
  inicio <- Sys.time()
  resultado_orig <- soma_par_original(A, k)
  fim <- Sys.time()
  tempo_orig <- as.numeric(fim - inicio)
  tempos_original <- c(tempos_original, tempo_orig)
  
  # Algoritmo melhorado
  inicio <- Sys.time()
  resultado_melh <- soma_par_melhorado(A, k)
  fim <- Sys.time()
  tempo_melh <- as.numeric(fim - inicio)
  tempos_melhorado <- c(tempos_melhorado, tempo_melh)
  
  # mostrar progresso a cada rodada
  cat(sprintf("Rodada %2d/30 | Original: %.4fs | Melhorado: %.4fs\n", 
              rodada, tempo_orig, tempo_melh))
}

#-------- RESULTADOS --------
media_original <- mean(tempos_original)
media_melhorado <- mean(tempos_melhorado)
ganho <- media_original / media_melhorado

cat("ALGORITMO ORIGINAL\n")
cat(" Média: ", round(media_original, 4), " segundos\n")
cat(" Mínimo: ", round(min(tempos_original), 4), " segundos\n")      # CORRIGIDO
cat(" Máximo: ", round(max(tempos_original), 4), " segundos\n")      # CORRIGIDO
cat(" Desvio padrão: ", round(sd(tempos_original), 4), " segundos\n\n") # CORRIGIDO

cat("ALGORITMO MELHORADO\n")
cat(" Média: ", round(media_melhorado, 4), " segundos\n")
cat(" Mínimo: ", round(min(tempos_melhorado), 4), " segundos\n")     # CORRIGIDO
cat(" Máximo: ", round(max(tempos_melhorado), 4), " segundos\n")     # CORRIGIDO
cat(" Desvio padrão: ", round(sd(tempos_melhorado), 4), " segundos\n\n") # CORRIGIDO

cat("COMPARAÇÃO:\n")
cat(" O algoritmo melhorado foi", round(ganho, 2), "x mais rápido\n")
cat(" Diferença de tempo:", round(media_original - media_melhorado, 4), "segundos\n\n")

#-------- ANÁLISE --------
cat("A análise teórica previu:\n")
cat(" Original: O(n²) aproximadamente 5e9 operações\n")
cat(" Melhorado: O(n) aproximadamente 1e5 operações\n\n")

if(media_original > media_melhorado) {
  cat("✓ Os resultados experimentais CONFIRMAM a análise!\n")
  cat(" O algoritmo O(n) foi", round(ganho, 0), "x mais rápido que O(n²)\n")
} else {
  cat("X Algo deu errado! O original não pode ser mais rápido que o melhorado.\n")
  cat(" Verifique se o vetor A foi criado corretamente.\n")
}