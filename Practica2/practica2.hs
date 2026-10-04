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
    Uso: cashbackMonto 423 = 42.3
-}

cashbackMonto :: Double -> Double
cashbackMonto puntos = puntos * 0.10

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

esEstafa :: Double -> Double -> Double -> Double -> Bool
esEstafa precio primero cambio recuperado =
    if primero - precio == cambio
    then
        if recuperado < cambio
        then True
        else False
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

{-
    Función: imc
    Descripción: Determina el índice de masa corporal (imc). Recibe los kilogramos y la altura en centímetros 
    y devuelve la interpretación del imc según la OMS: bajo, normal, sobrepeso u obesidad
    Uso: imc 60 160 = Normal
-}

imc :: Double -> Double -> IO()
imc kg cm = 
    let m = cm / 100
        imc = kg / (m * m)
    in if imc < 18.5 
       then putStrLn ("Bajo")
       else if imc < 25
       then putStrLn ("Normal")
       else if imc < 30
       then putStrLn ("Sobrepeso")
       else putStrLn ("Obesidad")

{-
    Función: hipotenusa
    Descripción: Calcula la hipotenusa de un triángulo rectángulo, recibiendo la base y la altura
    Uso: hipotenusa 3 4 = 5.0
-}

hipotenusa :: Float -> Float -> Float
hipotenusa b h = sqrt (b * b + h * h) 

{-
    Función: pendiente
    Descripción: Calcula la pendiente de la recta que pasa por dos puntos, recibiendolos mediante tuplas con dos elementos
    Uso: pendiente (5.0, 6.0) (10.0, 9.0) = 0.6
-}

pendiente :: (Float, Float) -> (Float, Float) -> Float
pendiente (x1, y1) (x2, y2) = (y2 - y1) / (x2 - x1)

{-
    Función: distanciaPuntos
    Descripción: Calcula la distancia entre dos puntos, recibiendolos mediante tuplas con dos elementos
    Uso: distanciaPuntos (1.0 , 2.0) (1.0 , 7.0) = 5.0
-}

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1, y1) (x2, y2) = sqrt ((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))