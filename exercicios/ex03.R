# ============================================
# EXERCÍCIO - Somatório vs For
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

# ============================================
# EXEMPLO PRÁTICO 1: Somatório de uma constante
# ============================================

# MÉTODO 1: Usando a fórmula matemática (mais eficiente)
# A fórmula Σ (i=x até y) de c = (y - x + 1) * c

# Atribuindo valores às variáveis
y <- 3 # valor final
x <- 2 # valor inicial
c <- 5 # constante que será somada

resultado <- (y - x + 1) * c

print(resultado)

# MÉTODO 2: Usando for (para entender a relação com sigma)
# O for abaixo representa a mesma operação matemática do somatório

soma_for <- 0  # variável para acumular a soma

for (i in x:y) {
  soma_for <- soma_for + c  # soma a constante c a cada iteração
}

print(soma_for)