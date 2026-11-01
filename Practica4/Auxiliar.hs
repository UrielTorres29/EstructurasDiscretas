module Auxiliar (Natural(..), sumaNat, multiplicaNat) where
data Natural = Cero | S Natural deriving (Eq, Show)

{-
    Función: sumaNat
    Descripción: Suma dos Naturales
    Uso: sumaNat 
-}

sumaNat :: Natural -> Natural -> Natural
sumaNat Cero m = m
sumaNat (S n) m = S (sumaNat n m)

{-
    Función: multiplicaNat
    Descripción: Multiplica dos Naturales
    Uso: multiplicaNat 
-}

multiplicaNat :: Natural -> Natural -> Natural
multiplicaNat Cero m = Cero
multiplicaNat (S n) m = sumaNat m (multiplicaNat n m)