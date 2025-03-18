import System.IO
import Data.List (splitAt, sortOn, take, drop, sort)
import Data.Ord (Down(..))
import Control.Monad (forM_)

main :: IO ()
main = do
    inputs <- getLine
    -- Separa por espaços (words), converte para int e faz um map
    let [n1, n2, n3, n4] = map read (words inputs) :: [Int]
    countryData <- readCSV "dados.csv"
    let sumActive = sumActiveConfirmed n1 countryData
    putStrLn $ show sumActive
    let sumDeaths = sumDeathsInTopActiveLowestConfirmed n2 n3 countryData
    putStrLn $ show sumDeaths
    let topCountries = topConfirmedCountries n4 countryData
    forM_ topCountries putStrLn

-- Define um tipo de struct para representar cada linha do CSV
data CountryData = CountryData
    { country   :: String
    , confirmed :: Int
    , deaths    :: Int
    , recovery  :: Int
    , active    :: Int
    } deriving (Show)

-- Função para dividir uma string em partes usando um delimitador
splitOn :: Char -> String -> [String]
splitOn _ [] = [""]
splitOn delimiter (c:cs)
    | c == delimiter = "" : rest
    | otherwise = (c : head rest) : tail rest
  where
    rest = splitOn delimiter cs

-- Função para converter uma linha do CSV em um tipo de dado CountryData
parseLine :: String -> CountryData
parseLine line =
    let [c, conf, d, r, a] = splitOn ',' line
    in CountryData c (read conf) (read d) (read r) (read a)

-- Função para ler o arquivo CSV e retornar uma lista de CountryData
readCSV :: FilePath -> IO [CountryData]
readCSV filePath = do
    contents <- readFile filePath
    let linesOfCSV = lines contents  -- Lê todas as linhas do arquivo
    return $ map parseLine linesOfCSV

-- Função para calcular a soma de "Active" onde "Confirmed" >= n1
sumActiveConfirmed :: Int -> [CountryData] -> Int
sumActiveConfirmed n1 = sum . map active . filter (\cd -> confirmed cd >= n1)

-- Função para calcular a soma das "Deaths" dos n3 países com menores valores de "Confirmed"
sumDeathsInTopActiveLowestConfirmed :: Int -> Int -> [CountryData] -> Int
sumDeathsInTopActiveLowestConfirmed n2 n3 =
    sum . map deaths . take n3 . sortOn confirmed . take n2 . sortOn (Down . active)

-- Função para obter os n4 países com maiores valores de "Confirmed" em ordem alfabética
topConfirmedCountries :: Int -> [CountryData] -> [String]
topConfirmedCountries n4 =
    sort . map country . take n4 . sortOn (Down . confirmed)
