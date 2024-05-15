main :: IO ()
main = do
    putStr $
        show $
        length $
        maiorSegmentoCrescente [1, 2, 3, 2, 3, 4, 1, 2]

maiorSegmentoCrescente :: Ord a => [a] -> [a]
maiorSegmentoCrescente xs = maior (segmentosCrescentes xs)

segmentosCrescentes :: Ord a => [a] -> [[a]]
segmentosCrescentes [] = []
segmentosCrescentes [x] = [[x]]
segmentosCrescentes (x:y:xs)
    | x <= y    = (x : head segs) : tail segs
    | otherwise = [x] : segs
    where segs = segmentosCrescentes (y:xs)

maior :: Ord a => [[a]] -> [a]
maior [] = []
maior [x] = x
maior (x:y:xs) = if length x >= length y then maior (x:xs) else maior (y:xs)
