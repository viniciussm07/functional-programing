main :: IO ()
main = do
    l1 <- getLine
    let x = map read (words l1) :: [Int]
    -- putStr $ show $ criaFrames x

    -- Printa os frames formatados em ordem decrescente 
    mapM_ (\(i, frame) -> putStrLn $ "Frame " ++ show i ++ " : " ++ show (primeiraBola frame) ++ ", " ++ show (segundaBola frame) ++ ", " ++ show (bolaExtra1 frame) ++ ", " ++ show (bolaExtra2 frame)) (zip [10,9..] (criaFrames x))

-- Estruturas de dados
data Frame = Frame { primeiraBola :: Int, segundaBola :: Int, bolaExtra1 :: Int, bolaExtra2 :: Int}
    deriving (Show, Read)

data Placar = Placar { frames :: [Frame], pontuacao :: Int}
    deriving (Show, Read)

-- Função que recebe uma lista de inteiros e retorna um Placar
-- com os frames e a pontuação corretas
-- criaPlacar :: [Int] -> Placar
-- criaPlacar [] = Placar [] [] 0
-- criaPlacar (x:xs) = Placar (criaFrames1 (x:xs)) (criaBonus (x:xs)) (calculaPontuacao (criaFrames1 (x:xs)) (criaBonus (x:xs)))

-- Função que recebe uma lista de inteiros e retorna uma lista de Frames contando as bolas extras caso existam
criaFrames :: [Int] -> [Frame]
criaFrames = go []
    where 
        go frames [] = frames
        go frames (x:xs)
            -- caso base
            | length frames == 10 = frames
            -- caso em que a primeira bola do último frame é 10 e a primeira bola extra também é 10
            | length frames == 9 && x == 10 && (head xs) == 10 = go (Frame x 0 (head xs) (head(tail xs)) : frames) (tail xs)
            -- caso em que a primeira bola do último frame é 10 e a primeira bola extra não é 10
            | length frames == 9 && x == 10 = go (Frame x 0 (head xs) 0 : frames) (tail xs)
            -- caso em que a primeira e segunda bola do último frame somam 10 (spare)
            | length frames == 9 && x + (head xs) == 10 = go (Frame x (head xs) (head(tail xs)) 0 : frames) (tail xs)
            -- caso strike básico
            | x == 10 = go (Frame x 0 0 0 : frames) xs
            -- caso básico
            | otherwise = go (Frame x (head xs) 0 0 : frames) (tail xs)