main :: IO ()
main = do
    l1 <- getLine
    l2 <- getLine
    let x :: Integer
        x = read l1
    let y :: Integer
        y = read l2
    let primosNoIntervalo :: [Integer]
        primosNoIntervalo = filter (\z -> ehPrimo z 2) [x..y]
    putStr $ show $ calcularMaximaDiferenca primosNoIntervalo

calcularMaximaDiferenca :: [Integer] -> Integer
calcularMaximaDiferenca [] = 0  -- Nenhum primo no intervalo
calcularMaximaDiferenca [_] = 0  -- Apenas um primo, sem diferenças para calcular
calcularMaximaDiferenca xs = maximum $ zipWith (-) (tail xs) xs

ehPrimo :: Integer -> Integer -> Bool
ehPrimo 1 _ = False
ehPrimo 2 _ = True
ehPrimo n i
    | n < 1 = False
    | n `mod` i == 0 = False
    | i * i > n = True
    | otherwise = ehPrimo n (i+1)