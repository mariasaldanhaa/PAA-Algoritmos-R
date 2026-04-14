# ============================================
# EXERCÍCIO: Fazer um algoritmo de busca 
# binária de forma decrescente
# ============================================

rm(list = ls())

A <- c(1, 4, 7, 12, 50, 31, 56, 70) 
esq <- 8
dir <- 1
k <- 56

while (esq > dir + 1) {
    meio <- as.integer((esq + dir) / 2) ## converte para inteiro
    
    if (k < A[meio]) {
        esq <- meio - 1
    } else {
        dir <- meio
    }
}

if (A[dir] == k) {      
    cat(dir)            
} else {
    cat(-1)
}