# ============================================
# EXERCÍCIO - Soma de dois somatórios
# 
# Conceito: O somatório (Σ) é a representação matemática 
#           de um laço de repetição (for) na programação.
# ============================================

# FÓRMULA MATEMÁTICA:
# Σ (i = x até y) de c = (y - x + 1) * c
#
# Onde:
# - Σ (sigma) = somatório (equivale a um for)
# - i = variável de controle
# - x = valor inicial
# - y = valor final
# - c = constante (valor que será repetido)

rm(list = ls())

Ay <- 3 ## declarando as variaveis do primeiro somatorio
Ax <- 2
Ac <- 5

By <- 4 ## declarando as variaveis do segundo somatorio
Bx <- 3
Bc <- 12

resultadoA <- (Ay - Ax + 1) * Ac
resultadoB <- (By - Bx + 1) * Bc

print(resultadoA + resultadoB)