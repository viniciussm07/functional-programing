main :: IO ()
main = do
    l1 <- getLine
    l2 <- getLine
    let x :: Integer
        x = read l1
    let y :: Integer
        y = read l2
    let primosNoIntervalo :: [Integer]
        primosNoIntervalo = filtro (\z -> ehPrimo z 2) [x..y]
    let diferencaPrimosConsecutivos :: [Integer]
        diferencaPrimosConsecutivos = zipWith (-) (tail primosNoIntervalo) primosNoIntervalo -- zipWith recebe uma função e duas listas do mesmo tipo e retorna uma lista da operação feita elemento por elemento
    putStr $ show $ maximo diferencaPrimosConsecutivos

-- Função t é o teste para filtrar a lista
filtro :: (a -> Bool) -> [a] -> [a]
filtro _ [] = []
filtro t (x:xs)
  | t x = x:c -- não ignora a cabeça
  | otherwise = c -- ignora a cabeça
  where
    c = filtro t xs

ehPrimo :: Integer -> Integer -> Bool
ehPrimo 1 _ = False
ehPrimo 2 _ = True
ehPrimo n i
    | n < 1 = False
    | n `mod` i == 0 = False
    | i * i > n = True
    | otherwise = ehPrimo n (i+1)

maximo :: [Integer] -> Integer
maximo [] = 0
maximo [x] = x
maximo (x:xs) = max x (maximo xs)