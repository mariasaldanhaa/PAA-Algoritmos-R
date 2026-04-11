# ============================================
# EXERCÍCIO: Soma dos primeiros n números naturais
# ============================================
#
# CONCEITO MATEMÁTICO:
# Σ (i = 1 até n) de i = 1 + 2 + 3 + ... + n = n(n + 1) / 2
#
# ONDE:
# Σ (sigma) = somatório (representa um laço de repetição)
# i = variável que vai de 1 até n
# n = número limite da soma
# ============================================
rm(list = ls())

i <- 1
n <- 10

resultado <- n * (n + 1) / 2
print(resultado)