def eh_primo(num, i=2):
    # Casos base
    if num <= 1:
        return False
    elif num == 2:
        return True
    elif num % i == 0:
        return False
    elif i * i > num:
        return True
    # Recursão
    return eh_primo(num, i + 1)

#Dado um intervalo [a, b], a função deve retornar uma lista com todos os números primos no intervalo
def primos_no_intervalo(inicio, fim):
    return list(filter(eh_primo, range(inicio, fim + 1)))

#Dada uma lista ordenada de números inteiros, a função deve retornar uma lista com a diferença entre cada número e o seu sucessor
def diferenca_numeros_consecutivos(lista):
    return [j - i for i, j in zip(lista[:-1], lista[1:])]

#Dada uma lista de números inteiros, a função deve retornar o maior número da lista
def maior(lst):
    if len(lst) == 0:
        return 0
    elif len(lst) == 1:
        return lst[0]
    else:
        return (lambda x, y: x if x > y else y)(lst[0], maior(lst[1:]))  

def main():
    x = int(input())
    y = int(input())

    lista_primos = primos_no_intervalo(x, y)

    print(maior(diferenca_numeros_consecutivos(lista_primos)))

if __name__ == "__main__":
    main()