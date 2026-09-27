{-
    Función: reconversion
    Descripción: Calcula una conversión monetaria, quitando tres ceros al valor ingresado
    Uso: reconversion 1500 = 1.5
-}

reconversion :: Double -> Double
reconversion x = x / 1000

{-
    Función: cashback
    Descripción: Calcula el cashback del 10% de una Tarjeta de Crédito, devolviendo los puntos enteros
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

{-
    Función: esEstafa
    Descripción: Determina si una transacción es una estafa hacia un comerciante. Recibe el precio del producto, 
    el primer billete entregado, el cambio dado al comprador y el cambio que recupera el comerciante después de recibir
    un segundo billete (equivalente al precio del producto).
    Uso: esEstafa 200 500 300 300 = False
-}

esEstafa :: Int -> Int -> Int -> Int -> Bool
esEstafa precio primero cambio recuperado =
    if primero - precio == cambio
    then
        if recuperado == cambio
        then False
        else True
    else False

{-
    Función: esDescendente
    Descripción: Determina si cuatro números fueron ingresados en orden descendente
    Uso: esDescendente 4 5 6 7 = False
-}

esDescendente :: Int -> Int -> Int -> Int -> Bool
esDescendente x y z w =
    if x > y 
    then 
        if y > z
        then    
            if z > w
            then True
            else False
        else False
    else False