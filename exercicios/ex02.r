# ============================================
# EXERCÍCIO: Exponenciação com FOR
# Calcula a potência de um número usando laço de repetição
# ============================================

rm(list = ls())

num <- 2
expo <- 3

for(i in 1:expo) {
  resultado <- num**i
}
print(resultado)