# Práctica 4: *Recursión*

---
## Objetivo

El objetivo de la práctica es comprender e implementar la recursión en Haskell, en este caso mediante funciones recursivas, definiendo también nuestros propios tipos de datos, aplicando patrones y construyendo listas. Además, entender cómo se pueden realizar operaciones y comparaciones usando estructuras definidas por nosotros mismos, sin depender de los tipos de datos por defecto o ya definidos.

---
## Tiempo requerido

El tiempo requerido para realizar esta práctica fue de aproximadamente 2 horas

---
### Ejercicio favorito

Funcion ***multiEnt***

---
## La Chivita Recursiva

En la canción "Sal de ahí, chivita, chivita" se puede identificar la recursión gracias a la serie de pasos que se hacen para que la chivita salga de donde está. Al principio se intenta convencer a la chivita, pero como no quiere salir, se necesita la ayuda de alguien mas, pero este tampoco quiere, por lo que se busca la ayuda de alguien más, y así sucesivamente.

Esto se relaciona con la recursividad porque cada nuevo intento depende de resolver una situación que paso antes, haciendo una secuencia mas grande y repitiendo los mismos pasos, hasta que al final se encuentra una solución, funcionando está como un caso base, ya que detiene las llamadas y hace que lo pendiente se empiece a resolver.

---
## Comparación de ```enteros.hs``` y ```entero.hs```

### 1. ¿Cuál es la diferencia de las operaciones implementadas en ambos archivos? 

El primer archivo ```enteros.hs``` tiene tres funciones:
- mayorEnt: recibe dos números enteros y verifica si el primero es mayor que el segundo.
- sumaEnt: suma dos números enteros.
- restaEnt: resta dos números enteros.

El segundo archivo ```entero.hs``` tiene solo dos funiones:
- suma_ent: suma dos números enteros.
- resta_ent: resta dos números enteros.

La diferencia es que el primer archivo usa una función mas: ***mayorEnt***, para comparar los números y poder hacer la suma y resta de enteros, mientras que el segundo hace esas operaciones directamente y solo con recursividad.

### ¿Como se manejan todos los casos en cada implementación?

#### Archivo 1: ```enteros.hs```

1) Función ***mayorEnt***: Esta función compara dos números enteros para verificar si el primero es mayor que el segundo.

Tiene estos casos:
- Positivos con cero.
- Negativos con cero.
- Positivos con negativos.
- Negativos con positivos.
- Dos positivos.
- Dos negativos.

Cuando los dos números tienen el mismo signo, vuelve a compararlos quitandoles un sucesor, en el caso de los positivos, o quitandoles el signo, en el caso de los negativos.

2) Función ***sumaEnt***

Tiene estos casos:
- Si uno de los números es cero, devuelve el otro.
- Si los dos son positivos, le quita un sucesor al primer número, colocandolo al inicio y volviendo a sumar el primer número menos 1 y el segundo.
- Si ambos son negativos, suma sus números y deja el signo negativo.
- Si tienen signos diferentes, usa un if para preguntar si son iguales para devolver cero, si no, resta sus números sin el signo.

3) Función ***restaEnt***

Tiene estos casos:
- Restar cero devuelve el número original.
- Restar un positivo a cero devuelve un negativo.
- Restar un negativo a cero devuelve un positivo.
- Si los dos son positivos, compara las magnitudes usando ```mayorEnt``` para determinar el signo del resultado y restarlos nuevamente.
- Si los dos son negativos, suma el primer negativo con el número del segundo sin el signo.
- Si tienen signos diferentes, suma ambos números y si el primero es negativo, el resultado será negativo.

#### Archivo 2: ```entero.hs```

1) Función ***suma_ent***

Esta implementación usa estos casos base, contemplando todos los casos donde un número es cero:

- suma_ent Zero m = m
- suma_ent n Zero = n

Tiene estos casos recursivos:
- Dos positivos se suman con recursión.
- Dos negativos se suman dejando el signo negativo.
- Un positivo y un negativo se resuelven usando la resta.
- Un negativo y un positivo también se resuelven usando resta.

2) Función ***resta_ent***

Esta implementación usa estos casos:
- Si el segundo número es cero, devuelve el primero.
- Si el primero es cero y el segundo es positivo, devuelve un negativo.
- Si el primero es cero y el segundo es negativo, devuelve un positivo.

- Si los dos son positivos, se restan con recursión quitandoles un sucesor.
- Si los dos son negativos, también se restan con recursión quitandoles el signo.
- Si el segundo es negativo, usa la suma para resolver la operación.

### 2. ¿Por qué se tiene implementada la operación *mayorEnt* en el archivo ```enteros.hs```?

Esta función se implementó para comparar dos números enteros y determinar cuál es mayor, usandose para hacer mas fácil la operación de la resta. Cuando se restan dos números positivos, el resultado puede ser positivo, negativo o cero, por eso, se necesita saber cual de los dos números es mas grande y asi poder colocarle el signo correcto al resultado.

### 3. Si pudieras quedarte con una sola implementación. ¿Cuál sería? Justifica tu respuesta.

Yo me quedaría con la implementación del archivo ```enteros.hs``` porque creo que considera todos los casos o combinaciones entre número positivos, negativos y cero, y aunque usa una función mas y algunas condiciones para la resta, considero que asi es mas fácil entender como se resuelven todos los casos.

Por su parte, el archivo ```entero.hs```, aunque tiene un código más corto, creo que puede tener errores en algunas operaciones, ya que no se consideran algunos casos, por ejemplo:

1. No considera el caso de restar un positivo a un número negativo ((Neg n) (Succ m)).
2. En la resta de dos negativos devuelve resta_ent n m, pero debería invertir el orden de los números.
3. En los casos de restar un negativo, devuleve Succ m para hacer el número positivo, pero esto le suma uno al resultado.

Por eso creo que el primer archivo es una mejor opción.

---
## Funciones 

En el archivo ***natural.hs*** se implementaron las siguientes funciones:

- a_natural: Recibe un entero no negativo y lo lleva a su estructura de dato Natural
- a_entero: Recibe un Natural y lo lleva a su valor entero
- potenciaNat: Eleva un número Natural a la potencia del segundo 
- facNat: Devuelve el factorial de un Natural dado

En el archivo ***entero.hs*** se implementaron las siguientes funciones:

- multiEnt: Múltiplica dos Enteros

En el archivo ***mati.hs*** se implementaron las siguientes funciones:

- mayorIgual: Compara dos Matrioskas y verifica si la primera tiene mas o igual cantidad de matrioskas dentro que la segunda
- aplana: Convierte una matrioska anidada en una lista con todas las matrioskas que la componen

En el modulo ***Auxiliar.hs*** se implementaron las siguientes funciones:

- sumaNat: Suma dos naturales
- multiplicaNat: Multiplica dos Naturales
- sumaEntPos: Suma dos Enteros no negativos

Todas las funciones estan comentadas dentro del mismo archivo

---
## Uso del archivo en GHCi 

Para usar las funciones se debe de abrir GHCi desde la terminal, usando:

```
ghci
```

y cargar el archivo:

```
:l practica4.hs
```

Después se pueden ejecutar las funciones desde el prompt de GHCi, por ejemplo:

```
ghci> a_entero (S(S(S(S(S Cero)))))
5

ghci> multiEnt (Neg(Succ(Succ Zero))) (Succ(Succ Zero))
Neg (Succ (Succ (Succ (Succ Zero))))

ghci> aplana (Cont(Cont Mati))
[Cont (Cont Mati),Cont Mati,Mati]
```
---
## Comentarios 

La función ***sumaEntPos*** solo fue implementada para sumar números Enteros positivos, ya que la función ***multiEnt*** no usa la suma de negativos, para otras funciones si sería necesario implementarla.