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