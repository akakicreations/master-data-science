import math
lista = []
for i in range(10**8):
    if i%2 == 0:
        lista.append(math.tan(i))
resultado = sum(lista)
