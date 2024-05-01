-- USO DE GUARDAS E WHERE

-- função sinal.
sinal :: Integer -> Integer
sinal x
  | x < 0 = -1
  | x == 0 = 0
  | otherwise = 1

-- fatorial com guardas
fat :: Integer -> Integer
fat n 
  | n == 0 = 1
  | otherwise = n* fat (n-1)

tempo :: Integer -> String
tempo t
  | t < 0 = "Congelante"
  | t < 15 = "Fresco"
  | t < 25 = "Agradável"
  | t < 35 = "Quente"
  | t < 45 = "Escaldante"
  | otherwise = "Morto"

imc :: Float -> Float -> String 
imc h w 
  | b < 20 = "Abaixo"
  | b < 30 = "Normal"
  | b < 35 = "Sobrepeso"
  | otherwise = "Obeso"
  where
    b = w / (h*h)

baskara :: Float -> Float -> Float -> [Float]
baskara a b c 
  | delta > 0 = [(-b+sqdelta) / (2*a),(-b-sqdelta) / (2*a)]
  | delta == 0 = [(-b)/ (2*a)]
  | otherwise = []
  where
    delta = b*b - 4*a*c
    sqdelta = delta**0.5 -- nem sempre vai ser executado (preguiça)

main = do
  l <- getLine
  let x :: Integer
      x = read l
  let s = fat x
  let str = show s 
  putStrLn str
