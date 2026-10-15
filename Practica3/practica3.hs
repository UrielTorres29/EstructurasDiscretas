import Auxiliar_Modulo

{-
    Tipo de dato: Plazo
    Descripción: Representa el plazo de una inversión en días o meses.
-}

data Plazo = Dias Int | Meses Int deriving (Show)

{- 
    Función: cetes
    Descripción: Calcula el monto final de una inversión en cetes, durante algun plazo de días o meses.
    Recibe el monto inicial y el plazo
    Uso: cetes 200 (Dias 182) = 206.98677777777777
-}

cetes :: Double -> Plazo -> Double
cetes dinero (Dias 28) = dinero * (1 + 0.0609 * 28 / 360)
cetes dinero (Dias 182) = dinero * (1 + 0.0691 * 182 / 360)
cetes dinero (Dias 364) = dinero * (1 + 0.0744 * 364 / 360)
cetes dinero (Meses 1) = dinero * (1 + 0.0609 * 28 / 360)
cetes dinero (Meses 6) = dinero * (1 + 0.0691 * 182 / 360)
cetes dinero (Meses 12) = dinero * (1 + 0.0744 * 364 / 360)
cetes _ _ = error "Plazo no valido"

{- 
    Función: mensajeCetes
    Descripción: Devuelve un mensaje que indica el plazo de una inversión, el rendimiento bruto obtenido y el monto acumulado al finalizar el plazo. 
    Recibe el monto inicial y el plazo
    Uso: mensajeCetes 200 (Meses 1) = Despues de 1 meses , obtuve 0.9473333333333187 de rendimiento bruto sin asumir ningun riesgo crediticio. El monto total de mi inversion es de 200.94733333333332
-}

mensajeCetes :: Double -> Plazo -> IO()
mensajeCetes dinero (Dias n) = putStrLn ("Despues de " ++ show n ++ " dias , obtuve " ++ show (montoFinal - dinero) ++ " de rendimiento bruto sin asumir ningun riesgo crediticio. El monto total de mi inversion es de " ++ show montoFinal)
    where montoFinal = cetes dinero (Dias n)
mensajeCetes dinero (Meses n) = putStrLn ("Despues de " ++ show n ++ " meses , obtuve " ++ show (montoFinal - dinero) ++ " de rendimiento bruto sin asumir ningun riesgo crediticio. El monto total de mi inversion es de " ++ show montoFinal)
    where montoFinal = cetes dinero (Meses n)

{- 
    Función: negativos
    Descripción: Cuenta los números negativos de una lista
    Uso: negativos [1, -5, 6, 7, -9, -10, -2] = 4
-}

negativos :: [Int] -> Int
negativos lista = length [n | n <- lista, n < 0]

{- 
    Función: soloPares
    Descripción: Recibe una lista y devuelve otra con los números pares de la lista original, usando la función esParBit.
    Uso: soloPares [1, 10, -6, 5, 0, -2] = [10,-6,0,-2]
-}

soloPares :: [Int] -> [Int]
soloPares lista = [n | n <- lista, esParBit n]

{- 
    Función: primos
    Descripción: Recibe una lista y devuelve otra con los números primos de la lista original, usando la función numPrimo 
    Uso: primos [2, 4, 5, 8, 9, 11] = [2,5,11]
-}

primos :: [Int] -> [Int]
primos lista = [n | n <- lista, numPrimo n]

{- 
    Función: coprimos
    Descripción: Recibe un entero y devuelve una lista de los coprimos menores a ese entero. 
    Uso: coprimos coprimos 15 = [1,2,4,7,8,11,13,14]
-}

coprimos :: Int -> [Int]
coprimos n = [c | c <- [1..n-1], length [d | d <- [2..c], mod n d == 0, mod c d == 0] == 0]