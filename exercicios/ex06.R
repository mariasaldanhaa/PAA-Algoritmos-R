# ============================================
# BuscaLinear(A, n, k)
# ============================================
#
# ONDE:
# - n: quantidade de elementos
# - k: numero
# - A: vetor 
# - i: posicao do elementos

rm(list = ls())

A <- c(10, 25, 7, 42, 15, 30)
i <- 7
n <- 1
k <- 42

while(i <= n && A[i] != k) {
    i = i + 1
}
if(i <= n && A[i] == k) {
    cat(i)
} else {
    print("-1")
}