# Cabeça e cauda é muito comum em funcional para vetores

def cabeca(a):
  return a[0]

def cauda(a):
  return a[1:]

# Funções da aula passada

def somavec(a):
  if len(a)==1:
    return cabeca(a)
  else:
    c = cabeca(a)
    m = somavec(cauda(a))
    return c + m
  
def minvec(a):
  if len(a)==1:
    return cabeca(a)
  else:
    c = cabeca(a)
    m = minvec(cauda(a))
    if c < m:
      return c
    else:
      return m
    
def maxvec(a):
  if len(a)==1:
    return cabeca(a)
  else:
    c = cabeca(a)
    m = maxvec(cauda(a))
    if c > m:
      return c
    else:
      return m
    
# Mas estamos copiando e colocando de forma desnecessária :(


# Função de alta ordem (função dentro de função)
# Função de primeira classe (função é um tipo de dado)
# Define a função na linha que for usar

def processavec(a, comb): 
  if len(a)==1:
    return cabeca(a)
  else:
    c = cabeca(a)
    m = processavec(cauda(a),comb)
    return comb(c, m)
    if c > m:
      return c
    else:
      return m
    
array = [4, 3, 2, 1]
print(processavec(array, lambda x, y: x + y))
print(processavec(array, lambda x, y: x if x < y else y))
print(processavec(array, lambda x, y: str(x) + str(y)))

def select(a, test): # Seleciona os elementos maiores que zero
  if len(a) == 0:
    return []
  else:
    c = cabeca(a)
    m = select(cauda(a),test)
    if test(c):
      return [c] + m # Lista + lista
    else:
      return m
    
print(select(array,lambda x: x > 0))

def qs(a): # Quicksort
  if len(a) <= 1:
    return a
  else:
    pivot = cabeca(a)
    return qs(select(a, lambda x: x < pivot))+ select(a,lambda x:x==pivot) + qs((select(a, lambda x: x > pivot)))

print(qs(array))