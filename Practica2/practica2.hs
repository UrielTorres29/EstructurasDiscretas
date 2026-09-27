{-
    Función: reconversion
    Descripción: Quita tres ceros al valor ingresado
    Uso: reconversion 1500 = 1.5
-}

reconversion :: Double -> Double
reconversion x = x / 1000

{-
    Función: cashback
    Descripción: Calcula el cashback del 10% de una Tarjeta de Crédito
    Uso: cashback 1856 = 185
-}

cashback :: Int -> Int
cashback x = div (x * 10) 100

{-
    Función: cashbackMonto
    Descripción: Calcula el dinero equivalente a los puntos del cashback
    Uso: cashbackMonto 423 0.10 = 42.3
-}

cashbackMonto :: Double -> Double -> Double
cashbackMonto puntos dinero = puntos * dinero

{-
    Función: minutosHoras
    Descripción: Convierte los minutos en horas
    Uso: 142 = 2 horas y 22 minutos
-}

minutosHoras :: Int -> IO()
minutosHoras x = putStrLn (show (div x 60) ++ " horas y " ++ show (mod x 60) ++ " minutos")