# Práctica 1: *Haskell + Git + GitHub*

---

## 1. ¿Cuáles son las principales diferencias entre Haskell y Rust?

Haskell y Rust son dos lenguajes de programación creados con propósitos y filosofías distintos, por lo que tienen varias diferencias:

**Paradigma principal**

Un *paradigma* es la filosofía o estilo con el que se resuelve un problema en código.

Por un lado, **Haskell** es un *lenguaje puramente funcional*, en el que todo es tratado como funciones matemáticas. Todas las variables son *inmutables* por defecto, es decir, al crear un dato o variable, este nunca cambia y, si se quiere modificar, se debe crear una nueva variable con el cambio ya aplicado. Además, Haskell no tiene *efectos secundarios* en el código normal, o sea, ninguna función hace algo fuera de sí misma (como cambiar una variable global, modificar un archivo en el disco duro o imprimir texto en la pantalla). Si una función recibe el número 2, siempre devolverá el mismo resultado sin cambiar nada del exterior. Aunque, si se necesita hacer un efecto secundario (como leer el teclado), este debe pedirse a un contenedor especial llamado Mónada IO. Todo esto garantiza que la lógica principal no sea afectada por errores externos.

En cambio, **Rust** es multiparadigma y combina características de varios mundos. Tiene herramientas de la programación funcional (como iteradores sofisticados y transformación de datos), pero también permite escribir instrucciones paso a paso (modo imperativo) cuando se necesita velocidad. Aunque las variables también son inmutables por defecto, Rust sí permite modificar datos cuando sea necesario. Para esto, se debe colocar la palabra clave `mut` (de *mutable*) para estar al tanto de ello.

<br>**Gestión de memoria**

Para ejecutar cualquier programa, la computadora necesita guardar datos en la memoria RAM y borrar los que ya no usa.

**Haskell** utiliza un *Recolector de Basura (GC)* muy avanzado que rastrea la RAM y limpia automáticamente los datos que ya no se utilizan, por lo que este se encarga de todo en el fondo, despreocupando al programador en cuanto a la memoria RAM. Esto hace que programar sea mucho más fácil y rápido de razonar, aunque de vez en cuando el Recolector debe "pausar" un milisegundo el programa para limpiar la memoria, lo cual no es ideal si se está haciendo un videojuego o el software de un automóvil.

**Rust**, en cambio, no usa Recolector de Basura, pero tampoco te deja limpiar la memoria manualmente (lo cual provocaría fallos). Este inventó un concepto llamado *Sistema de Propiedad (Ownership)*, en el que cada dato en la memoria RAM tiene un único "dueño" (una variable), y cuando esa variable sale de la pantalla o termina su función, Rust destruye el dato de la RAM instantáneamente y, si otra parte del programa necesita ese dato, la variable original se lo *presta (Borrowing)*. Esto permite avanzar con mucha rapidez, como pasa en C o C++ (sin pausas) y con la seguridad de que no habrá problemas de memoria.

<br>**Modelo de Evaluación**

Evaluar es ejecutar el cálculo de una operación (por ejemplo, resolver 2 + 2).

**Haskell**, por su parte, usa un modelo de evaluación perezosa, pues no resuelve ningún cálculo hasta que la pantalla, el usuario le exija o el resultado sea necesario. Por ejemplo, al definir una lista que contenga todos los números enteros desde el 1 hasta el infinito, un lenguaje común se trabaría tratando de crear esa lista, mientras que Haskell no, porque no crea nada, solo lo calcula si es necesario más adelante.

**Rust** es muy distinto, pues en el momento en que se declara una operación en una línea de código, la resuelve de inmediato.

<br>**Nivel de Abstracción**

Decimos que *Alto Nivel* es el código que se parece más a la lógica matemática o al idioma humano, por lo que el programador no piensa en chips, ni en RAM, ni en procesadores.

Decimos que *Bajo Nivel* es el código que controla directamente la memoria física, los núcleos del procesador y los periféricos.

**Haskell** es un lenguaje de alto nivel y podemos decir que te aleja por completo de la máquina física. Cuando se le solicita resolver algo matemáticamente, el compilador de Haskell decide cómo traducirlo a la computadora de la mejor forma posible.

**Rust** permite control de bajo nivel, aunque también tiene algunas abstracciones de alto nivel, pues permite más control sobre la computadora (como controlar punteros de memoria, bytes individuales, enviar instrucciones directas a la tarjeta de video). Aunque también te permite escribir código de bajo nivel usando conceptos de alto nivel sin perder velocidad (a esto se le llama Abstracciones de Costo Cero).

<br>**Manejo de Errores y Mutabilidad**

¿Qué es un valor *Null* / Nulo? En la mayoría de lenguajes tradicionales, si intentas usar una variable que no contiene nada (es nula), el programa explota inmediatamente.

En **Haskell**, en lugar de usar *Null*, Haskell utiliza tipos de datos matemáticos como *Maybe* (que puede ser *Just valor* o *Nothing*). Esto obliga al programador a escribir código para manejar el caso donde no hay datos antes de poder compilar.
Para cambiar un estado o dato, usa constructos llamados Mónadas, los cuales funcionan como una "caja blindada" en la que realizas cambios sin ensuciar el resto del programa.

**Rust** tampoco tiene Null, utiliza un tipo llamado *Option* (que es *Some(valor)* o *None*) y *Result* (para manejar errores explícitos).
Para la mutabilidad, Rust usa el *Compilador Verificador de Préstamos (Borrow Checker)*, el cual permite modificar un dato solo si garantiza que nadie más en ese mismo instante lo está leyendo. Esto ayuda a prevenir los fallos cuando dos procesos intentan cambiar la misma variable al mismo tiempo (condiciones de carrera o *data races*).

<br>**¿Para qué se usa cada uno en el mundo real?**

**Haskell**:

* Sistemas Bancarios y Financieros de Alto Riesgo: Donde un error de redondeo o lógica puede costar millones de dólares y la corrección matemática es vital.
* Creación de Compiladores e Intérpretes: Haskell también puede usarse para desarrollar compiladores e intérpretes.
* Análisis de Datos Complejos e Investigación Científica.

**Rust**:

* Motores de Videojuegos y Gráficos 3D: Se procesan 60 o 120 cuadros por segundo sin micro-pausas.
* Sistemas Operativos y Navegadores Web: Rust se usa en proyectos de software, incluyendo componentes de Firefox, Linux, Windows y Android.
* Criptografía y Redes: Donde la velocidad y la protección contra hackeos de memoria son la mayor prioridad.

---

## 2. ¿Por qué Haskell no ha alcanzado una adopción significativa en la industria del software?

Aunque no sea un lenguaje masivo, Haskell sí tiene presencia en la industria en sectores donde se necesita la precisión y la seguridad matemática. Empresas tecnológicas y financieras de alto nivel lo usan en algunos de sus sistemas: Meta (Facebook) lo utiliza para combatir el spam, GitHub gestiona el análisis de código con él, y la infraestructura de la criptomoneda Cardano está programada en Haskell. También, en el sector de banca de inversión (como Standard Chartered), se usa para modelar productos financieros sin el riesgo de errores.

Sin embargo, su adopción en la industria no es tan grande en comparación con lenguajes como Python, Java o Go, debido a múltiples factores:

1. La Curva de Aprendizaje
   La mayoría de los programadores aprenden lenguajes imperativos u orientados a objetos (como Python, JavaScript, Java o C++), donde le dicen a la computadora paso a paso qué hacer. Haskell obliga a los desarrolladores a familiarizarse con conceptos nuevos y obviar lo que usan habitualmente, lo que los hace pensar más en términos de lógica matemática y teoría de categorías. Conceptos como mónadas, functores, curryficación y recursión pura son muy difíciles de dominar al principio.

Para las empresas es costoso y tardado capacitar a sus equipos en Haskell cuando ya conocen herramientas tradicionales con las que pueden ser productivos desde el primer día.

2. Falta de personal capacitado
   Debido a la curva de aprendizaje, hay una comunidad de desarrolladores muy pequeña en comparación con otros lenguajes. Si una empresa construye todo su sistema en Haskell y un ingeniero clave renuncia, reemplazarlo o escalar el equipo se vuelve muy complicado. Es por esto que las empresas prefieren lenguajes populares (como Go, Python o Java) simplemente porque el mercado laboral está lleno de profesionales capacitados en ellos.

3. La Evaluación Perezosa (*Lazy Evaluation*)
   Esta se refiere a cuando Haskell pospone los cálculos hasta el último momento posible. Aunque teóricamente es una idea muy buena, en la práctica hace difícil saber cuánta memoria RAM está consumiendo tu programa en un momento específico, lo que puede provocar "fugas de memoria" impredecibles (*space leaks* o valores que permanecen en memoria durante más tiempo del necesario) si no se maneja con un conocimiento extremadamente profundo del compilador.

En servidores de producción, las empresas necesitan métricas estables y predecibles. Descubrir un pico de consumo de memoria no deseado a las 3:00 AM en producción es algo que los ingenieros no desean.

4. Ecosistema y Librerías orientado a la Investigación
   Un Ecosistema es el conjunto de librerías, marcos de trabajo (*frameworks*), herramientas y soluciones empaquetadas creadas por la comunidad (por ejemplo, conectar una base de datos, procesar un pago con tarjeta, etc.).

El problema de Haskell es que gran parte de la comunidad viene del ámbito académico y muchas de las librerías disponibles son proyectos de investigación que no cuentan con una documentación clara, soporte a largo plazo o mantenimiento para su uso comercial.

5. Las herencias
   Aunque Haskell demostró que conceptos como la inmutabilidad, la concordancia de patrones (*pattern matching*) y los sistemas de tipos avanzados eran ideas muy buenas para evitar errores, lenguajes más modernos e industriales (como Rust, Kotlin, Swift o Scala) incorporaron algunas de sus características, pero las integraron en entornos más amigables, con evaluación estricta y sintaxis más cercana a la programación tradicional.

---

## 3. Si tuvieras que explicarle a una persona que no es de CC la función que cumple Git frente a la de GitHub, ¿cómo se lo explicarías?

Primero explicaría que cuando muchas personas trabajan en un mismo proyecto, suele pasar que alguno borre el trabajo de otro o que se pierdan algunas versiones de este proyecto.

Git es una herramienta de software que soluciona este problema, porque guarda todos los cambios que se hacen en el proyecto, siendo como un historial de estos cambios. Esto es muy útil porque si se comete algún error, Git nos permite volver versiones atrás, sin importar qué tan viejas sean, y evitar dichos errores.

Git se instala localmente, es decir, que se instala en tu propia computadora, lo que permite que tú y varios desarrolladores tengan copias del proyecto en sus propios dispositivos y puedan trabajar en él por separado, funcionando como borradores.

Ahora, GitHub funciona como un servicio en la nube en donde se pueden alojar repositorios de Git, es decir, que aquí puedes subir los cambios que haces del proyecto en Git a Internet, funcionando como una biblioteca de todos los borradores que cada desarrollador haga por separado, lo cual permite que otros descarguen tus cambios y puedan añadirle otros o aportar sugerencias.

---
## FUENTES

- Rust. (s/f). Aprende Rust. Rust-lang.org. Recuperado el 22 de septiembre de 2026, de https://rust-lang.org/es/learn/

- Rust. (s/f). Introduction - The Rust Programming Language. The Rust Programming Language. Recuperado el 22 de septiembre de 2026, de https://doc.rust-lang.org/book/ch00-00-introduction.html

- Software Guru. (s/f). Rust MX | Rust y Haskell [Video]. YouTube. https://www.youtube.com/watch?v=CoRtiwWt3xw

- Sancho, F. (s/f). Haskell: el lenguaje funcional. Universidad de Sevilla. Recuperado el 22 de septiembre de 2026, de https://www.cs.us.es/~fsancho/Blog/posts/Haskell_el_lenguaje_funcional.md