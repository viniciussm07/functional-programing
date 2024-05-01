# Função pura, estado imutável, transparência referencial e retorna uma lista (mesmo tipo de dado)

def baskara(a,b,c): # É funcional :)
    delta = b**2 - 4*a*c
    if delta < 0:
        return []
    elif delta == 0:
        return [-b/(2*a)]
    else:
        sqdelta = delta ** 0.5
        x1 = (-b + sqdelta)/(2*a)
        x2 = (-b - sqdelta)/(2*a)
        return [x1,x2]
        
# ---------------------------------------------------------------------------------------------------------
        
a=1 # Se alguém mudar a global, muda tudo

def baskara(b,c): # Não é funcional :(
    b = float(input()) # Posso mudar o b, tornando ele diferente do b do parâmetro
    delta = b**2 - 4*a*c
    if delta < 0:
        print("Não tem raízes reais") # Efeito colateral
    elif delta == 0:
        return [-b/(2*a)]
    else:
        sqdelta = delta ** 0.5
        x1 = (-b + sqdelta)/(2*a)
        x2 = (-b - sqdelta)/(2*a)
        return [x1,x2]
        
# ---------------------------------------------------------------------------------------------------------
        
# Função pura, sem efeito colateral, sem transparência, sem estado imutável

def soma_de_1_ate_n(n):
    i = 1
    s = 0
    while i <= n: 
        s += i 
        i += i+1 
    return s 
    
# ---------------------------------------------------------------------------------------------------------

# Solução: recursão = não afeta as variáveis de cada função na recursão, eles tem seus próprios a e n 

def soma_de_1_ate_n_recursivo(n):
    return soma_de_a_ate_n(1,n)

def soma_de_a_ate_n(a, n):
    if a > n:
        return 0
    else:
        return a + soma_de_a_ate_n(a+1, n)  
        
# ---------------------------------------------------------------------------------------------------------

# Outra solução = acumula no parâmetro das funções recursivas -> Solução Mecânica!

def soma1atenrec(n):
    return soma1atenrecaux(1,0,n) # inicia as variáveis
    
def soma1atenrecaux(i,s,n): # laço vira recursão
    if not (i <= n): # condição do laço vira condição para manter na recursão
        return s # se não obedece a condição, sai do laço, ou seja, vai pro caso base da recursão
        
    else:
        return soma1atenrecaux(i+1,s+i,n) # acumula os valores 
        
# ---------------------------------------------------------------------------------------------------------

def somavec(a): # Soma de todo o vetor
    if len(a) == 1: # Se o vetor tiver apenas 1 elemento
        return a[0] # Cabeça da lista
    else:
        return a[0] + somavec(a[1:]) # Soma cabeça + toda a calda
        
        
def minvec(a): # Menor elemento do vetor
    if len(a) == 1:
        return a[0]
    else:
        m = minvec(a[1:])
        if a[0] < m:
            a[0]
        else:
            return m
            
def maxvec(a): # Maior elemento do vetor
    if len(a) == 1:
        return a[0]
    else:
        m = maxvec(a[1:])
        if a[0] < m:
            a[0]
        else:
            return m
            
def difmaxmin(a): # Diferença do maior e do menor
    return maxvec(a) - minvec(a)
        
# Os três códigos acima são a mesma coisa, vamos unir todos com função de primeira classe e alta ordem


