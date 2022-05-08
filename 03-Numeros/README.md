# Preguntas teóricas

## Aporte de los mensajes de DD
### En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?
En un DD el primer objecto -el que recibe el primer mensaje- sabe a qué clase pertenece, pero desconoce la clase del colaborador externo dado que se trata de polimorfismo.
Esta información se envía a través de mensajes al colaborador externo por lo que este último conocería la clase del primer objeto así como la suya propia.
Ya con la información de ambas clases, el código correcto se ejecuta del lado del segundo objeto.

## Lógica de instanciado
### Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?
Nos parece apropiado que la lógica para instanciar un objeto esté dentro de la clase a la que este pertenece.
Esto no solo resulta en código más prolijo y mantenible sino que también respeta el encapsulamiento. En otra de las respuestas nos explayamos en por qué estaría mal romper el encapsulamiento.
En el caso de que el objeto se cree desde diferentes lugares, corresponde que todos estos lugares hagan referencia a la clase en cuestión, para que esta instancie al objeto.
Incluso si hay múltiples maneras de crear el objeto, todas estas deberían ser conocidas por la clase, y las clases ajenas a esta no deberían conocer su implementación interna.

## Nombres de las categorías de métodos
### Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?
Los métodos los venimos categorizando principalmente entre privados y públicos, estando los públicos a su vez subcategorizados por Qué Hacen.
Por ejemplo, las operaciones arítmeticas estarían en una categoría mientras los métodos que son para representar al objeto en pantalla estarían en otra.

## Subclass Responsibility
### Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?
Poner "self subclassResponsibility" como implementación de un método de la superclase es útil para indicar que todas las subclases que uno crea dentro de esa superclase, deberían tener implementado ese método.
Esto es apropiado cuando se sabe que todas las subclases de una superclase comparten un comportamiento, como se sabe que todos los tipos de números se deberían saber sumar entre ellos.
La subclassResponsibility es especialmente útil en casos de polimorfismo, donde se espera que todas las subclases sepan responder un mensaje y tengan un comportamiento en común.

## No rompas
### ¿Por qué está mal/qué problemas trae romper encapsulamiento?
Uno de los principales problemas de romper el encapsulamiento es que lleva a código dificil de mantener.
Si uno interactúa con un objeto directamente modificando sus colaboradores internos en vez de a través de métodos, si el día de mañana se desea cambiar estos colaborades habría más código que hay que corregir.
Por ejemplo, si los usuarios de una red social se guardan en una lista y se decide empezar a guardarlos en una tabla de hash para mejorar la eficiencia, habría que corregir todos los bloques de código que interactúan de manera directa con esa lista.
También es más fácil de depurar el código que respeta el encapsulamiento teniendo en consideración que los objetos solo interactúan mediante sus métodos públicos.

