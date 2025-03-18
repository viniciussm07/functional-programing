main = do
    l <- getLine
    let n :: Int
        n = read l 
    let w1 = [1..]
    let w2 = map sq w1 -- map = aplica a função tal em cada elem da lista
    let w3 = take n w2
    let s = sum w3
    let str = show s
    putStrLn str
    
sq :: Int -> Int 
sq x = x * x
