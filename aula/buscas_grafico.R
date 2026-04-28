rm(list = ls())

#busca linear
busca_linear <- function(A, n, k) {
  inicio <- Sys.time()
  
  for(i in 1:n) {
    if(A[i] == k) {
      fim <- Sys.time()
      tempo_total <- difftime(fim, inicio, unit="secs")
      return(list(posicao = i))
    }
  }
  
  fim <- Sys.time()
  tempo_total <- difftime(fim, inicio, unit="secs")
  return(list(posicao = -1, tempo_total = tempo_total))
}

#busca linear ordenada
busca_linear_ordenada <- function(A, n, k) {
  inicio <- Sys.time()
  
  for(i in 1:n) {
    if(A[i] == k) {
      #para e retorna
      fim <- Sys.time()
      tempo_total <- difftime(fim, inicio, unit = "secs")
      return(list(posicao = i))
    } else {
      #para o algoritmo
      break
    }
  }
  fim <- Sys.time()
  tempo_total <- difftime(fim, inicio, unit = "secs")
  return(list(posicao = -1, tempo_total = tempo_total))
}

#busca binaria
busca_binaria <- function(A, n, k) {
  inicio <- Sys.time()
  
  esquerda <- 1
  direita <- n
  
  while(esquerda <= direita) {
    meio <- floor((esquerda + direita) / 2)
    
    #para quando não encontrar o valor de k - divide
    if(A[meio] < k) {
      esquerda <- meio + 1
    } else {
      direita <- meio - 1 
    }
  }
  # se o elemento k não existir no vetor, mesmo dividindo
  fim <- Sys.time()
  tempo_total <- difftime(fim, inicio, unit = "secs")
  return(list(posicao = -1, tempo_total = tempo_total))
}

#remocao de outliers
remove_outliers <- function(x, na.rm = TRUE) {
  gnt <- quantile(x, probs = c(0.25, 0.75), na.rm = na.rm)
  H <- 1.5 * IQR(x, na.rm = na.rm)
  x[x >= (gnt[1] - H) & x <= (gnt[2] + H)]
}

#configuracao do experimento
nmax <- 100
nexec <- 30

#vetores que guardam os tempos dos algoritmos
plotsBL <- numeric(nmax)
plotsBO <- numeric(nmax)
plotsBB <- numeric(nmax)

#itera o tamanho do vetor
for(n in 1:nmax) {
  temposBL <- numeric(nmax)
  temposBO <- numeric(nmax)
  temposBB <- numeric(nmax)
  
  #definindo a chave de busca
  k <- (n/4 + 0.1)
  
  #executa cada algortimo 30 vezes
  for(i in 1:nexec) {
    vet <- seq(1, n, by = 1)
    resultadoBL <- busca_linear(vet, n, k)
    resultadoBO <- busca_linear_ordenada(vet, n, k)
    resultadoBB <- busca_binaria(vet, n, k)
    
    #armazena os tempos de cada execuçao
    temposBL[i] <- resultadoBL$tempo_total
    temposBO[i] <- resultadoBO$tempo_total
    temposBB[i] <- resultadoBB$tempo_total
  }
  #calcula e guarda as medias de tempos
  plotsBL[n] <- mean(as.numeric(temposBL))
  plotsBO[n] <- mean(as.numeric(temposBO))
  plotsBB[n] <- mean(as.numeric(temposBB))
} 

plotsBL <- remove_outliers(plotsBL)
plotsBO <- remove_outliers(plotsBO)
plotsBB <- remove_outliers(plotsBB)

#identificando o menor e o maor tempo em todas as execucoes
minvalue <- min(c(plotsBL, plotsBO, plotsBB))
maxvalue <- max(c(plotsBL, plotsBO, plotsBB))

plot(plotsBL, type = "l", col="blue", ylim=c(minvalue, maxvalue), ylab="", xlab="", main="")
par(new = T)
plot(plotsBO, type = "l", col="purple", ylim=c(minvalue, maxvalue), ylab="", xlab="", main="")
par(new = T)
plot(plotsBB, type = "l", col="pink", ylim=c(minvalue, maxvalue), ylab="Tempo médio (segundos)", xlab="Tamanho do vetor", main="")
legend("topright", legend=c("BL", "BO", "BB"), col=c("blue", "purple", "pink"), lty=1, cex=0.8)