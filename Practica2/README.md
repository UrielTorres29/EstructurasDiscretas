# Práctica 2: *Thinking in Haskell (Introducción)*

---
## Objetivo

Definir y probar algunas funciones básicas usando el lenguaje de programación Haskell y su intéprete GHCi, además de poner en prática la creación de archivos .hs, su carga y su ejecución.

---
## Tiempo requerido

El tiempo requerido para realizar esta práctica fue de aproximadamente 3 horas

---
## Prompt y carga de archivo

Se incluye la captura de pantalla de un prompt inicial y la carga del archivo *practica2.hs* mediante GHCi

![ghci](prompt_carga.png)

---
## Funciones 
En el archivo ***Practica.hs*** se implementaron las siguientes funciones:

- reconversion: Realiza una conversión monetaria, quitandole tres ceros a una cantidad.
- cashback: Calcula el 10 % de cashback de una Tarjeta de Crédito.
- cashbackMonto: Convierte una cantidad de puntos de cashback en dinero.
- minutosHoras: Convierte los minutos en horas.
- esEstafa: Determina si una transacción es una estafa hacia un comerciante.
- esDescendente: Determina si cuatro números se encuentran orden descendente.

Todas las funciones estan comentadas dentro del mismo archivo

---
## Uso del archivo en GHCi 

Para usar las funciones se debe de abrir GHCi desde la terminal, usando:

```javascript
ghci
```

y cargar el archivo:

```javascript
:l Practica.hs
```

Después se pueden ejecutar las funciones desde el prompt de GHCi, por ejemplo:

```javascript
ghci> :l Practica.hs
ghci> reconversion 1000
1.0
```
---
## Comentarios 

La función ***cashback*** devuleve el 10% de una cantidad en puntos enteros, es decir, que no devuelve cantidades con punto decimal, (por ejemplo, el cashback de 1356 = 135 y no 135.6 )

En la función de ***cashbackMonto*** pueden aparecer resultados como 25.400000000000002, esto al hacer operaciones con números decimales o de tipo Double, debido a que los números después del punto no pueden representarse exactamente en binario (lenguaje usado por la computadora), es por eso que se agregan ceros de más.