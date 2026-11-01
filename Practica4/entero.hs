import Auxiliar (Entero(..), sumaEntPos)

{-
    Función: multiEnt
    Descripción: Toma dos enteros y regresa el producto de ellos
    Uso: multiEnt (Neg(Succ(Succ(Succ Zero)))) (Neg(Succ(Succ Zero))) = Succ (Succ (Succ (Succ (Succ (Succ Zero)))))
-}

multiEnt :: Entero -> Entero -> Entero
multiEnt Zero m = Zero
multiEnt n Zero = Zero
multiEnt (Succ n) (Succ m) = sumaEntPos (Succ m) (multiEnt n (Succ m))
multiEnt (Neg n) (Neg m) = multiEnt n m
multiEnt (Succ n) (Neg m) = Neg (multiEnt (Succ n) m)
multiEnt (Neg n) (Succ m) = Neg (multiEnt n (Succ m))