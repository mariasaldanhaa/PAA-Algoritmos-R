# ============================================
# EXERCÍCIO: Cálculo do Fatorial usando FOR
# 
# Fatorial: n! = n * (n-1) * (n-2) * ... * 1
# Exemplo: 3! = 3 * 2 * 1 = 6
# ============================================

number <- 3
resultado <- 1

for(i in number:1) {
  resultado <- resultado * i
}
print(resultado)