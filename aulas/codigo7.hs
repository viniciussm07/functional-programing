-- ! Todas essas funções estão prontas já em bibliotecas, mas vamos fazer cada uma

main = do
    putStr $ 
      show $ 
      enesimo 3 $ 
      [4, 3, 2, 6, 7, 5, 4] -- $ = substitui os parênteses
    putStr $ show $ enesimo 4 "Adenilso"
    putStr $ show $ conc [2, 3, 4] [3, 4, 5]
    putStr $ show $ conc "Adenilso" "Simao"
    putStr $ show $ mapa (\x -> x * 2) [3, 4, 5, 3, 2, 1] -- / = lambda
    putStr $ show $ mapa (*2) [3, 4, 5, 3, 2, 1] -- aplicação parcial
    putStr $ show $ mapa show[3, 4, 5, 0, 1]
    putStr $ show $ filtro(\x -> x > 5) [3, 6, 7, 2, 1, 9, 8]
    putStr $ show $ filtro(>5) [3, 6, 7, 2, 1, 9, 8] -- aplicação parcial
    putStr $ show $ filtro(\x -> (mod x 2)==1)[4,3,6,7,8,6,6,5]
    putStr $ show $ filtro(\x -> (x `mod` 2)==1)[4,3,6,7,8,6,6,5]

-- "Num a" devido a operação de subtração, e "Eq a" devido a comparação (nem todo número é comparável). 
-- A lista pode ser de qualquer coisa
enesimo :: (Num a,Eq a) => a -> [b] -> b
enesimo 0 (x:_) = x -- elemento zero de uma lista
enesimo n (_:xs) = enesimo (n - 1) xs -- n-ésimo elemento da lista

-- Primeiro [a] = conc []
-- Terceiro [a] = x:(conc xs l) = cabeça é um "a"
-- Segundo [a] = l = l na primeira linha, então l=[a]
conc :: [a] -> [a] -> [a]
-- Função que concatena a lista e um l
conc [] l = l
conc (x:xs) l = x:(conc xs l)

mapa :: (a -> b) -> [a] -> [b]
mapa g [] = []
mapa g (x:xs) = (g x):(mapa g xs)

-- Função t é o teste para filtrar a lista
filtro :: (a -> Bool) -> [a] -> [a]
filtro _ [] = []
filtro t (x:xs)
  | t x = x:c -- não ignora a cabeça
  | otherwise = c -- ignora a cabeça
  where
    c = filtro t xs

f :: (Num a, Eq a) => a -> [b] -> [b]
f 0 _ = []
f n (x:xs) = x:(f (n - 1) xs)

-- Símbolos são funções também, tudo é função!
a x y = x + y
p x y = x * y
c = 5 * 6 + 4 * 2 -- infix
d = a (p 5 6) (p 4 2) -- prefix
e = (+) ((*) 5 6) ((*)4 2) -- prefix
g = (5 `p` 6) `a` (4 `p` 2) -- infix

pertence :: (Eq a)=>a->[a]->Bool
_ `pertence`[] = False
x `pertence` (y:ys)
  | x == y = True
  | otherwise = x `pertence` ys

-- (*) => (Num a) => a -> a -> a