module Auxiliar where

-- Funciones Auxiliares para Naturales
data Natural = Cero | S Natural deriving (Eq, Show)

{-
    Función: sumaNat
    Descripción: Suma dos Naturales
    Uso: sumaNat (S(S(S Cero))) (S(S Cero)) = S (S (S (S (S Cero)))) 
-}

sumaNat :: Natural -> Natural -> Natural
sumaNat Cero m = m
sumaNat (S n) m = S (sumaNat n m)

{-
    Función: multiplicaNat
    Descripción: Multiplica dos Naturales
    Uso: multiplicaNat (S(S(S Cero))) (S(S Cero)) = S (S (S (S (S (S Cero))))) 
-}

multiplicaNat :: Natural -> Natural -> Natural
multiplicaNat Cero m = Cero
multiplicaNat (S n) m = sumaNat m (multiplicaNat n m)


-- Funciones Auxiliares para Enteros
data Entero = Zero | Succ Entero | Neg Entero deriving (Eq, Show)

{-
    Función: sumaEntPos
    Descripción: Suma dos Enteros no negativos
    Uso: sumaEntPos (Succ(Succ(Succ Zero))) (Succ(Succ Zero)) = Succ (Succ (Succ (Succ (Succ Zero)))) 
-}

sumaEntPos :: Entero -> Entero -> Entero
sumaEntPos Zero m = m
sumaEntPos (Succ n) m = Succ (sumaEntPos n m)