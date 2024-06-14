## Simbolo ;

Separa proposiciones. **Ejemplo:**

```C#
  PROGRAM Ejemplo;
  VAR a, b: integer;
  BEGIN
    a := 10;
    b := 20;
    writeln(a + b);
  END.
```


## END

El _END_ que engloba el programa debe de terminar **si o si** con un punto. **Ejemplo:**

```C#
  PROGRAM Ejemplo;
  VAR a: integer;
  BEGIN
    a := 10;
    writeln(a);
  END.
```

## Programas en Pascal

- Deben terminar con un punto.
- Deben de tener las proposiciones ejecutables encerradas entre las palabras _BEGIN_ y _END_.
- Es conveniente que incluyan:
    - Documentación en forma de comentarios.
    - Variables y constantes que se documenten a sí mismas.

**Palabras clave reservadas:**
    - PROGRAM
    - VAR
    - BEGIN
    - END
    - ...

**Aquí puedes encontrar una lista completa:** https://www.conoce3000.com/html/espaniol/Libros/PascalConFreePascal/Cap01-08-Palabras_reservadas_y_simbolos.php

**Indentación:**
```C#
  PROGRAM Ejemplo;
  VAR a, b: integer;
  BEGIN
    a := 10;
    b := 20;
    IF a > b THEN
      writeln('a es mayor que b');
    ELSE
      writeln('b es mayor que a');
  END.
```

**Comentarios:**
- Deben estar delimitados por las parejas _(* *)_, ó por llaves _{ }_

(* Este es un comentario de una línea *)

{ Este es un comentario
  de múltiples líneas }


### Variables:

- **Solo se les puede dar valores del tipo declarado.**
- **Deben tener un valor antes de que se puedan utilizar en una expresión.** Si no se inicializan, se genera un error de compilación.
- Si no son usadas, la consola enviará un mensaje de aviso.

**Tipos de datos:**

* Integer
* Real
* Boolean
* Char
* ...

Los datos del tipo **integer, char y boolean** se llaman del tipo _ordinal_

Los **reales** son excluidos debido a la presicion limitada de la aritmetica

**Declaración de variables:**
```c#
  VAR
    a: integer;
    b: real;
    c: char;
```

**Inicialización de variables:**
```c#
  VAR
    a: integer;
  BEGIN
    a := 10;
    ...
  END.
```

**Mensaje de aviso:**
```c#
  VAR
    a: integer;
  BEGIN
    ...
  END.

  // Aviso: La variable 'a' no se ha utilizado.
```

**¿Qué pasa si no se inicializa una variable en Pascal?**

En Pascal, no inicializar una variable genera un **error de compilación**. El compilador no permitirá que el programa se ejecute si hay variables sin inicializar.

**Ejemplo:**
```c#
  VAR
    i: integer;
    r: real;
  BEGIN
    r := i + 1; // Error: La variable 'i' no está inicializada
    writeln(i, r);
  END.
```

En este caso, el compilador mostrará un error similar a **"La variable 'i' no está inicializada"**.
