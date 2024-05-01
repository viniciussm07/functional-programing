# Anotações

* Haskell é non-strict (preguiça)
    * as coisas só são calculas quando e se necessário, senão eu ignoro 
    * só não há preguiça para tipagem!

* Função Pura -> Não dá para fazer muita coisa :/
    * Sem efeito colateral 
        * Não pode imprimir
        * Não pode ler do teclado
    * Dada mesma entrada, sai a mesma saída

|       | Pura | Impura |
|-------|------|--------|
| Pura  | sim  | sim    |
| Impura| não  | sim    |

Pura não pode usar impura!

* Haskell é bidimencional (modularizado)

* Int = int em C (limitado)
* Integer = os inteiros de verdade da matemática

* Guardas (|)
    * Usado para substituir if else if else if else ...
    * Fica muito próximo a matemática
    * Vai tentando cada guarda (|) e quando der true ele sai e retorna o valor
    * Cuidado! Precisa cuidar com a ordem que você coloca as guardas
    * Otherwise é sempre verdade
    * Where = depois das condições, usado para não repetir uma expressão várias vezes

* Padrão
    * Você dá alguns resultados e o Haskell encontra o padrão da função e acha o resultado, encaixando
    seu input em um dos padrões disponibilizados (casar o padrão)
    * Se só tem comparação de igualdade nas guardas, use padrão!
    * Só aceita igualdade

* Programando em Haskell de verdade
    * $ = substitui os parênteses (começa na direita da linha e vai voltando pra esquerda)
        * Usa pra função no parâmetro de outra e mais a direita precisa ter um valor só
    * Tipo mais restrito = função fica ok, mas os parâmetros ficam restritos
    * Tipo errado = ai a função nem compila
    * Compilador coloca automaticamente o tipo mais genérico
    * Tipo da cabeça da lista dita o tipo da lista, pois todos os elementos poderão um dia ser a cabeça
    * Símbolos são funções também, tudo é função!
    * Aplicação parcial = reduz uma função em apenas símbolos = facilita a leitura!