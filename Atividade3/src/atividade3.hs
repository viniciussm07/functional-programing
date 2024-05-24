main :: IO ()
main = do
    l1 <- getLine
    let x = map read (words l1) :: [Int]
    putStr $
        show $
        length $
        removeIguais $
        maiorLista $
        segmentosCrescentes x

segmentosCrescentes :: Ord a => [a] -> [[a]]
segmentosCrescentes [] = []
segmentosCrescentes [x] = [[x]]
segmentosCrescentes (x:y:xs)
    | x < y = (x : head segs) : tail segs
    | otherwise = [x] : segs
    where segs = segmentosCrescentes (y:xs)

maiorLista :: Ord a => [[a]] -> [a]
maiorLista [] = []
maiorLista [x] = x
maiorLista (x:y:xs) = if length x >= length y then maiorLista (x:xs) else maiorLista (y:xs)

removeIguais :: Eq a => [a] -> [a]
removeIguais [] = []
removeIguais (x:xs) = x : removeIguais (filter (/= x) xs)