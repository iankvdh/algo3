# Respuestas a preguntas después de hacer el ejercicio

## Sobre implementar funcionalidad
> Los tests 01, 02 y 03 demuestran la funcionalidad de cómo se incrementa la cantidad de huevos de avispas a medida que los van dejando. Cuando los implementaste, ¿esos tests pasaron (los tres) de una? ¿podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03? ¿se te ocurre cómo? Y si lograste hacerlo, ¿qué pensas de implementar esa funcionalidad de esa forma?

Los tests fueron pasando de a uno, dado que no hizo falta crear la avispa Oriana hasta el test2 por ejemplo, y hubo que corregir hacerQueElHabitatTengaLosRecursosSuficientes para el test3

## Sobre código repetido
> ¿les quedó código repetido? ¿dónde? ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)? Responsabilidad de dejar un huevo consumiendo otro insecto ¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat? ¿por qué? ¿por qué tendría sentido que fuera de la otra forma? ¿con cuál nos quedamos?

Quedó código repetido en los métodos de las avispas. Se podría corregir si utilizáramos Clases para representar la similitud entre avispas y sus métodos. Por ejemplo, podríamos haber crear un colaborador interno “comida” y otro “tipo” para el objeto Avispa. Luego hacer que todas las demás avispas sean descendientes de una sola, y asignarle a cada colaborador interno lo requerido según el tipo de la avispa. Así, utilizando herencia podríamos implementar tan solo el método “intentarReproducirse” en la Avispa principal. 
Pero nosotros no optamos por esa implementación porque creímos que sumaba complejidad innecesaria para tan pocos tipos de Avispas y además no hubiera sido del todo útil con la Avispa ladrona, ya que puede comer más de una cosa.
Con respecto al hábitat, logramos eliminar código repetido utilizando colaboradores internos en forma de diccionarios para guardar la información (cantidad de huevos, cantidad de recursos, etc.)
En el caso de la responsabilidad de dejar un huevo consumiendo otro insecto, en nuestro modelo la responsabilidad recae en el insecto que pone el huevo. Nos parece que este es un mejor módelo de la realidad dado que no tendría sentido que el Habitat como ser inerte verifique si se cumple la condición; sino que es el insecto el que debería asegurarse antes de poner un huevo.

## Sobre código repetido 2
> Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código? Sobre la implementación ¿cómo resolvieron guardar los huevos? ¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban? Pero la pregunta más importante: ¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?

Como explicamos en el punto anterior la utilización de las Clases y los diccionarios como colaboradores internos ayuda a eliminar código repetido.
En nuestra implementación utilizamos dos colaboradores internos (diccionarios) para el objeto Hábitat. 
Creemos que para pocas especies de Avispas (como era el caso) lo mas simple hubiera sido utilizar un colaborador interno del Hábitat para cada parámetro a guardar; pero al trabajar con un numero elevado de especies ahorramos mucho código repetido al usar los diccionarios utilizados.
Comparando los siguientes mensajes: 
• ponerHuevoDeAvispa: ‘tipoDeAvispa’	(usando un diccionario como colaborador interno)
• ponerHuevoDeAvispaTipoDeAvispa	(usando un colaborador para cada parámetro)
vemos que con el de arriba debemos implementar mucho menos código que con el de abajo cuando trabajamos con varios tipos de Avispas a la vez.
En conclusión, creemos que nuestra implementación no es la más simple posible; pero es mas mantenible y escalable que esa solución.
