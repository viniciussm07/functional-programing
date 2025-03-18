main :: IO ()
main = do
    l1 <- getLine
    l2 <- getLine
    let x :: Integer
        x = read l1
    let y :: Integer
        y = read l2
    let z1 = add x y 6
    let z2 = add x y w1 -- não uso o w1, então nem calculo ele (non-strict)
    let z = z1 + z2
    let str = show z -- classe Show = tudo que pode ser transformado em string (non-strict)
    putStrLn str
    
add :: (Num a, Ord a) => a -> a -> a -> a
add x y z = if x > 10
            then x + y
            else z -- só não funciona o programa quando for w2 ali na linha 10 e x <= 10

w1 = sum [1..1000]
w2 = sum[1..] -- rodaria pra sempre, mas se colocar na linha 10, no lugar de w1, não muda nada (non-strict)
