module Auxiliar_Modulo (esParBit, numPrimo) where
import Data.Bits 

{- 
    Función: esParBit
    Descripción: Verifica si un entero es par de acuerdo a sus operaciones entre bits
    Uso: esParBit 26 = True
-}

esParBit :: Int -> Bool
esParBit n = (n.&.1) == 0

{- 
    Función: numPrimo
    Descripción: Verifica si un número es primo
    Uso: numPrimo 7 = True
-}

numPrimo :: Int -> Bool
numPrimo n = 
    if n > 1 && length [div | div <- [2..n-1], mod n div == 0] == 0 then True
    else False
    
