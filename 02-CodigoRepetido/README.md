# Preguntas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

La entididad que creamos es un cronómetro, que sirve para medir la cantidad de tiempo que transcurre entre dos sucesos. En nuestro caso mide lo que tarda en ejecutar un bloque de código.

## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

Para representar entidades de la realidad en Smalltalk utilizamos instancias de clases. Ejemplo, si tenemos la clase cliente (que es la idea de un cliente), podemos crear una instancia de esa clase con el nombre Juan Perez, para representar al cliente Juan Perez que existe en la realidad.

## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

Al sacar código repetido y crear nuevas abstracciones los programadores van formando (modificando) la teoría de el programa segun la VCT. Luego, estos programadores serán los que conocen esa teoría por lo que saben cómo funciona, cómo está implementado.
Luego, estos programadores podran:
    •explicar cómo la solución se relaciona con los problemas del mundo real.
    •explicar por qué cada parte del programa es como es. En otras palabras, puede defender el texto del programa con algún tipo de justificación. 
    •responder constructivamente a cualquier demanda de modificación del programa