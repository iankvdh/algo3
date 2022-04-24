# Respuestas a preguntas después de hacer el ejercicio

## Sobre implementar funcionalidad
> Los tests 01, 02 y 03 demuestran la funcionalidad de cómo se incrementa la cantidad de huevos de avispas a medida que los van dejando. Cuando los implementaste, ¿esos tests pasaron (los tres) de una? ¿podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03? ¿se te ocurre cómo? Y si lograste hacerlo, ¿qué pensas de implementar esa funcionalidad de esa forma?

Los tests fueron pasando de a uno, dado que no hizo falta crear la avispa Oriana hasta el test2 por ejemplo, y hubo que corregir hacerQueElHabitatTengaLosRecursosSuficientes para el test3

## Sobre código repetido
> ¿les quedó código repetido? ¿dónde? ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)? Responsabilidad de dejar un huevo consumiendo otro insecto ¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat? ¿por qué? ¿por qué tendría sentido que fuera de la otra forma? ¿con cuál nos quedamos?

Quedó código repetido en los métodos de las avispas, Oriana y Ornella por ejemplo tienen métodos iguales. Se podría corregir si utilizaramos Clases para representar la similitud entre avispas y sus métodos.
También pasa con el Habitat que tiene métodos muy similares que varían únicamente en el colaborador al que hacen referencia, probablemente podríamos corregirlo utilizando un diccionario para los colaboradores internos del Habitat.

En el caso de la responsabilidad de dejar un huevo consumiendo otro insecto, en nuestro modelo la responsabilidad recae en el insecto que pone el huevo. Nos parece que este es un mejor módelo de la realidad dado que no tendría sentido que el Habitat como ser inerte verifique si se cumple la condición; sino que es el insecto el que debería asegurarse antes de poner un huevo.

## Sobre código repetido 2
> Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código? Sobre la implementación ¿cómo resolvieron guardar los huevos? ¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban? Pero la pregunta más importante: ¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?

Los huevos los guardamos cada uno en un colaborador interno del Habitat, sin usar colecciones ni diccionarios. Para pocas especies nos parece la manera que menos esfuerzo conlleva, aunque de haber usado diccionarios tendríamos menos código repetido y sería más fácil de mantener y escalar.
