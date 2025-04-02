main :: IO ()
main = do
    l1 <- getLine
    l2 <- getLine
    let x :: Int
        x = read l1
    let y :: Int
        y = read l2
    putStrLn $ show $ len $ filtro (\n -> somaLista (divisores n) < n) [x..y]
    putStrLn $ show $ len $ filtro (\n -> somaLista (divisores n) == n) [x..y]
    putStrLn $ show $ len $ filtro (\n -> somaLista (divisores n) > n) [x..y]


-- Função t é o teste para filtrar a lista
filtro :: (a -> Bool) -> [a] -> [a]
filtro _ [] = []
filtro t (x:xs)
  | t x = x:c -- não ignora a cabeça
  | otherwise = c -- ignora a cabeça
  where
    c = filtro t xs

len :: [a] -> Int
len [] = 0
len (_:xs) = 1 + len xs

divisores :: Int -> [Int]
divisores n = concatMap (\x -> if n `mod` x == 0 then [x] else []) [1..n `div` 2]

somaLista :: Num a => [a] -> a
somaLista [] = 0
somaLista (x:xs) = x + somaLista xs