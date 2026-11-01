data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)

{-
    Función: mayorIgual
    Descripción: Compara dos Matrioskas y verifica si la primera tiene mas o igual cantidad de matrioskas dentro que la segunda
    Uso: mayorIgual (Cont(Cont(Cont(Cont Mati)))) (Cont(Cont(Cont(Cont Mati)))) = True 
-}

mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual Mati Mati = True
mayorIgual Mati (Cont m) = False
mayorIgual (Cont n) Mati = True
mayorIgual (Cont n) (Cont m) = mayorIgual n m     

{-
    Función: aplana
    Descripción: Convierte una matrioska anidada en una lista con todas las matrioskas que la componen
    Uso: aplana (Cont(Cont(Cont Mati))) = [Cont (Cont (Cont Mati)),Cont (Cont Mati),Cont Mati,Mati] 
-}

aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana (Cont m) = Cont m : aplana m