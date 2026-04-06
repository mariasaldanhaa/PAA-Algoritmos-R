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
#
# IMPORTÂNCIA:
# Este exercício mostra que podemos substituir um laço for
# por uma fórmula matemática, tornando o algoritmo muito mais eficiente!
# ============================================

# MÉTODO 1: Usando a FÓRMULA MATEMÁTICA (mais eficiente)
# Complexidade: O(1) - executa apenas 1 operação
i <- 1
n <- 10

resultado <- n * (n + 1) / 2
print(resultado)

# MÉTODO 2: Usando FOR (para comparar e entender o conceito)
# Complexidade: O(n) - executa n operações
soma_for <- 0

for(i in 1:n) {
    soma_for <- soma_for + i
}
print(soma_for)