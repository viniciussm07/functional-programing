main :: IO ()
main = do
    l1 <- getLine
    let x = map read (words l1) :: [Int]
    putStr $
        show $ criaFrames x

-- Estruturas de dados
data Frame = Frame { primeiraBola :: Int, segundaBola :: Int }
    deriving (Show, Read)

data Placar = Placar { frames :: [Frame], bonus :: [Int], pontuacao :: Int}
    deriving (Show, Read)

-- Funções
-- Função que recebe uma lista de inteiros e retorna um Placar
-- com os frames e a pontuação corretas
-- criaPlacar :: [Int] -> Placar
-- criaPlacar [] = Placar [] [] 0
-- criaPlacar (x:xs) = Placar (criaFrames1 (x:xs)) (criaBonus (x:xs)) (calculaPontuacao (criaFrames1 (x:xs)) (criaBonus (x:xs)))

-- Função que recebe uma lista de inteiros e retorna uma lista de Frames (sem contar os bônus finais)

criaFrames :: [Int] -> [Frame]
criaFrames = go []
    where 
        go frames [] = frames
        go frames (x:xs)
            | length frames == 10 = frames
            | x == 10 = go (Frame x 0 : frames) xs
            | otherwise = go (Frame x (head xs) : frames) (tail xs)

-- Função que recebe uma lista de inteiros e retorna uma lista de inteiros
criaBonus :: [Int] -> [Int]
criaBonus [] = []
criaBonus (x:xs)
    | x == 10 = head xs : head (tail xs) : criaBonus xs
    | x + head xs == 10 = head (tail xs) : criaBonus (tail xs)
    | otherwise = criaBonus (tail xs)