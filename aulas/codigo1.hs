-- main eh impura, marco ela com IO no retorno
main :: IO ()

-- do eh impuro, pois depende de uma ordem, ou seja, depende do efeito colateral anterior
main = do 
    putStrLn "Hello"
    putStrLn "World"
    l <- getLine -- executa getLine com efeito colateral (pede o l mesmo eu não usando pq estou na parte impura)
    let v :: Integer
        v = read l -- pega uma string e transforma em um tipo (Inteiro no caso) = é pura, pra cada string da o mesmo tipo
    let x = 42  -- let define variáveis puras em função impura (só alinha elas que let define várias de uma vez)
        str = show x -- show converte um tipo em string = show é puro
        y = f x 3 -- let f x 3 não roda pois o f é puro, só retorna coisas, ent preciso usar essas coisas
    g x 3 -- função g é impura e esta sendo usada aqui da forma impura
    putStrLn str

f :: (Num a) => a -> a -> a
f x y = x + y

g :: (Num a) => a -> a -> IO ()
g x y = putStrLn "Hey"
