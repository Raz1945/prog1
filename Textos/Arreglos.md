# Arreglos en Pascal

Los arreglos en Pascal son una forma de agrupar datos del mismo tipo en una estructura ordenada. Aquí tienes más detalles sobre cómo declarar arreglos en Pascal:

- Un arreglo es una colección de elementos del mismo tipo, organizados en una secuencia.
- Cada elemento en el arreglo tiene un índice que comienza desde un valor mínimo y va hasta un valor máximo.
- En Pascal, los arreglos son homogéneos, lo que significa que todos los elementos deben ser del mismo tipo (por ejemplo, enteros, caracteres, etc.).
- La declaración de un arreglo se hace utilizando la palabra reservada `array`, seguida del índice (límite inferior y límite superior) y el tipo de dato que el arreglo contendrá.

## Ejemplo de declaración de un arreglo

```JavaScript
type
  vector = array [1 .. 50] of integer;
```

De hecho, es posible escribir la declaracion de variable sin emplear la definicion **TYPE**. 
```JavaScript
var
  vector: array [1 .. 50] of integer;
```

En este caso, hemos declarado un tipo de arreglo llamado `vector` que tiene 50 lugares para almacenar números enteros. El índice comienza en 1 y finaliza en 50.

## Acceso a elementos del arreglo

Para acceder a un elemento específico del arreglo, utilizamos su índice. Por ejemplo, para asignar un valor al quinto elemento del vector:

```JavaScript
var
  arreglo: vector;
begin
  arreglo[5] := 700;
end.
```

Recuerda que, como el vector fue declarado con números enteros, solo se pueden asignar valores enteros a sus elementos.

### Acceder a la posicion 0
- Si intentas acceder a la posición 0 del arreglo vector, **recibirás un error de compilacion**. 
- En Pascal, **los índices de los arreglos comienzan en 1, no en 0**. Por lo tanto, la posición 0 no existe dentro del arreglo y resultará en una excepción o comportamiento inesperado.

Para acceder al primer elemento del arreglo, debes utilizar el índice 1:

```JavaScript
var
  vector: array [1 .. 50] of integer;
begin
  vector[1] := 42; // Acceso al primer elemento
end.
```

## Rellenar un arreglo

Si necesitas llenar el vector con el número 0 en cada una de sus 50 posiciones, puedes hacerlo con una estructura iterativa:

```JavaScript
var
  arreglo: vector;
  i: 1 .. 50; // Establece un subrango para la variable.

begin
  for i := 1 to 50 do
    arreglo[i] := 0;
end.
```
