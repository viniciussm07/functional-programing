main :: IO ()
main = do
    l1 <- getLine
    l2 <- getLine
    l3 <- getLine
    let x :: Integer
        x = read l1
    let y :: Integer
        y = read l2
    let z :: Integer
        z = read l3
    if ehTriangulo x y z
        then putStrLn $ show $ heron x y z $ semiperimetro x y z
        else putStrLn "-"

ehTriangulo :: Integer -> Integer -> Integer -> Bool
ehTriangulo a b c
    | a + b >= c && a + c >= b && c + b >= a = True
    | otherwise = False

semiperimetro :: Integer -> Integer -> Integer -> Double
semiperimetro a b c = fromIntegral (a + b + c) / 2

heron :: Integer -> Integer -> Integer -> Double -> Double
heron a b c s = sqrt(s * (s - fromIntegral(a)) * (s - fromIntegral(b)) * (s - fromIntegral(c)))
