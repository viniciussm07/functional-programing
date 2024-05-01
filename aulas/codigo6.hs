-- PADRÃO
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

main = do
  let l = [4,5,3,8,9,4,2]
  let p = somapares l
  let str = show p
  putStrLn str

f :: Integer -> Integer -> Integer
f x y
  | x==5 && y==5 = 15
  | x==3 && y==6 = 12
  | x==4 = y+3
  | y==5 = x+4
  | otherwise = x+y

-- se for usar padrão
f' :: Integer -> Integer -> Integer
f' 3 4 = 7
f' 5 5 = 15
f' 6 5 = 15
f' 3 6 = 12
f' _ _ = 42 -- padrão anônimo, casa qualquer coisa aqui e eu não uso o que estou casando

fatorial :: Integer -> Integer
fatorial 0 = 1
fatorial n = n * (fatorial (n - 1))

-- ver não haskell
soma1 l = if l == []
        then 0
        else (head l)+(soma1(tail l))

-- ver com guardas
soma2 l
  |l == [] = 0
  |otherwise = (head l)+(soma2(tail l))

-- ver com padrão
soma3 [] = 0
soma3 l = (head l)+(soma3(tail l))

-- ver final 
-- padrão com decomposição: lista = (cabeça:calda)
soma [] = 0
soma (x:xs) = x + (soma xs)

-- função que soma de par em par os elementos de um vetor
-- Ex: [4,3,9,1,5,4] -> [7, 10, 9]
somapares :: [Integer] -> [Integer]
somapares [] = []
somapares [x] = [x]
somapares (x1:x2:xs) = (x1+x2):(somapares xs)

invertepares :: [Integer] -> [Integer]
invertepares [] = []
invertepares [x] = [x]
invertepares (x1:x2:xs) = x2:x1:(invertepares xs)

posimpar :: [Integer] -> [Integer]
posimpar []=[]
posimpar [x]=[x]
posimpar (x1:_:xs) = x1:(posimpar xs)

g [] = 0
g [x] = 1
g [[[x]:_]] = 2 -- [[[3],[],[5,6]]]