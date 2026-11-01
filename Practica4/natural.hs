import Auxiliar

{-
    Función: a_natural
    Descripción: Recibe un entero no negativo y lo lleva a su estructura de dato Natural
    Uso: a_natural 3 = S (S (S Cero))
-}

a_natural :: Int -> Natural
a_natural 0 = Cero
a_natural n = S (a_natural (n-1))

{-
    Función: a_entero
    Descripción: Recibe un Natural y lo lleva a su valor entero
    Uso: a_entero (S(S(S(S(S(S(S Cero))))))) = 7
-}

a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (S n) = 1 + a_entero n

{-
    Función: potenciaNat
    Descripción: Eleva un número Natural a la potencia del segundo 
    Uso: potenciaNat (S(S(S Cero))) (S(S Cero)) = S (S (S (S (S (S (S (S (S Cero))))))))
-}

potenciaNat :: Natural -> Natural -> Natural
potenciaNat n Cero = S Cero 
potenciaNat n (S m) = multiplicaNat n (potenciaNat n m)

{-
    Función: facNat
    Descripción: Devuelve el factorial de un Natural dado
    Uso: facNat (S(S(S Cero))) = S (S (S (S (S (S Cero)))))
-}

facNat :: Natural -> Natural
facNat Cero = S Cero
facNat (S n) = multiplicaNat (S n) (facNat n)