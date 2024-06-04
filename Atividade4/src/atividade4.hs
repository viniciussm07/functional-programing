main :: IO ()
main = do
    l1 <- getLine
    let x = map read (words l1) :: [Int]
    let frames = reverse $ criaFrames x
    let pontuacao = calculaPontuacao frames
    let pinos = criaPinosDerrubados frames
    let placar = Placar frames pontuacao pinos
    let Placar _ pontuacao pinos = placar
    putStrLn $ filter (/= '\"') $ show pinos ++ show pontuacao

    -- putStr $ show $ criaFrames x

    -- Printa os frames formatados em ordem decrescente 
    -- mapM_ (\(i, frame) -> putStrLn $ "Frame " ++ show i ++ " : " ++ show (primeiraBola frame) ++ ", " ++ show (segundaBola frame) ++ ", " ++ show (bolaExtra1 frame) ++ ", " ++ show (bolaExtra2 frame)) (zip [10,9..] (criaFrames x))
    
    -- let frames = criaFrames x
    -- putStr $ show $ calculaPontuacao frames


-- Estruturas de dados
data Frame = Frame { primeiraBola :: Int, segundaBola :: Int, bolaExtra1 :: Int, bolaExtra2 :: Int}
    deriving (Show, Read)

data Placar = Placar { frames :: [Frame], pontuacao :: Int, pinos :: String }
    deriving (Show, Read)

-- Função que recebe uma lista de inteiros e retorna uma lista de Frames contando as bolas extras caso existam
criaFrames :: [Int] -> [Frame]
criaFrames = go []
    where 
        go frames [] = frames
        go frames (x:xs)
            -- caso base
            | length frames == 10 = frames
            -- caso em que a primeira bola do último frame é strike e a primeira bola extra também é strike
            | length frames == 9 && x == 10 && (head xs) == 10 = go (Frame x 0 (head xs) (head(tail xs)) : frames) (tail xs)
            -- caso em que a primeira bola do último frame é strike e a primeira bola extra não é strike
            | length frames == 9 && x == 10 = go (Frame x 0 (head xs) (head(tail xs)): frames) (tail xs)
            -- caso em que a primeira e segunda bola do último frame é spare
            | length frames == 9 && x + (head xs) == 10 = go (Frame x (head xs) (head(tail xs)) 0 : frames) (tail xs)
            -- caso strike básico
            | x == 10 = go (Frame x 0 (head xs) (head(tail xs)) : frames) xs
            -- caso spare básico
            | x + (head xs) == 10 = go (Frame x (head xs) (head(tail xs)) 0 : frames) (tail xs)
            -- caso básico
            | otherwise = go (Frame x (head xs) 0 0 : frames) (tail xs)

calculaPontuacao :: [Frame] -> Int
calculaPontuacao [] = 0
calculaPontuacao (x:xs) = calculaPontuacao xs + calculaFrame x

calculaFrame :: Frame -> Int
calculaFrame (Frame x y z w)
    -- strike
    | x == 10 = x + y + z + w
    -- spare
    | x + y == 10 = x + y + z
    -- caso básico
    | otherwise = x + y

criaPinosDerrubados :: [Frame] -> String
criaPinosDerrubados [] = ""
criaPinosDerrubados (x:xs)
    -- 3 strikes no último frame
    | length xs == 0 && primeiraBola x == 10 && bolaExtra1 x == 10 && bolaExtra2 x == 10 = "X X X | "
    -- 2 strikes no último frame
    | length xs == 0 && primeiraBola x == 10 && bolaExtra1 x == 10 = "X X " ++ show (bolaExtra2 x) ++ " | "
    -- 1 strike e 1 spare no último frame
    | length xs == 0 && primeiraBola x == 10 && primeiraBola x + segundaBola x == 10 = "X " ++ show (bolaExtra1 x) ++ " / | "
    -- 1 spare e 1 strike no último frame
    | length xs == 0 && primeiraBola x + segundaBola x == 10 && bolaExtra1 x == 10 = show (primeiraBola x) ++ " / X | "
    -- 1 strike no último frame
    | length xs == 0 && primeiraBola x == 10 = "X " ++ show (bolaExtra1 x) ++ " " ++ show (bolaExtra2 x) ++ " | "
    -- spare na última bola
    | length xs == 0 && primeiraBola x + segundaBola x == 10 = show (primeiraBola x) ++ " / " ++ show (bolaExtra1 x) ++ " | "
    -- strike
    | primeiraBola x == 10 = "X " ++ "_ | " ++ criaPinosDerrubados xs
    -- spare
    | primeiraBola x + segundaBola x == 10 = show (primeiraBola x) ++ " / | " ++ criaPinosDerrubados xs
    -- caso básico
    | otherwise = show (primeiraBola x) ++ " " ++ show (segundaBola x) ++ " | " ++ criaPinosDerrubados xs
