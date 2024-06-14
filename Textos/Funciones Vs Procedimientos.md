# Funciones:
- Una función retorna un valor.
- Se utiliza para calcular un valor basado en una entrada.
- Puede aparecer en expresiones y se evalúa a un resultado.

Ejemplo: Una función que calcule la raíz cuadrada de un número y devuelva el resultado.

**Recomendaciones de estilo: funciones**
- No utilizar pasaje por referencia con funciones.
- No hacer entrada y salida dentro de funciones (read, write, etc)
- No utilizar variables globales (declaradas en el programa principal)
dentro de subprogramas.
- Asignar una sola vez y al final el valor de la función.
- Definir funciones para todo cálculo intermedio que sea independiente.
- Sólo definir funciones cuya semántica sea clara.


# Procedimientos:
-Un procedimiento no retorna un valor directamente.
-Se compone de un conjunto de comandos que se ejecutan en orden.
-No se puede utilizar dentro de una expresión.

Ejemplo: Un procedimiento que imprime un mensaje en pantalla o modifica variables sin devolver un valor.


# Parámetros nominales y efectivos
**Los parámetros nominales (también llamados formales)** son los nombres que aparecen en el encabezado de la función:
```C
  { Base y exponente son parámetros nominales }
  function potencia(base: real; exponente: integer): real;
```

*Los parámetros efectivos* (también llamados verdaderos) son las
expresiones que aparecen en la invocación de la función.
```C
  pot:= potencia(pi,23);
  ...
  WriteLn(potencia(2*pi*sqr(radio),N+2));
```
Para cada parámetro, el tipo del parámetro nominal y el tipo del respectivo parámetro efectivo deben ser compatibles.

## Parametros de valor y variables
Los parámetros formales son los que se utilizan en la definición de procedimientos o funciones. Existen dos formas principales de pasar parámetros a estos subprogramas: **por valor** y **por referencia**. Veamos las diferencias:

1. **Parámetros por Valor**
Son los parámetros _NO_ precedidos por _VAR_:
   - Cuando se pasa un parámetro por valor, se envía una **copia** del valor de la variable al procedimiento o función.
   - Los cambios realizados directamente en el valor del parámetro dentro del subprograma **no afectan la variable original** en el programa principal.
   - Es decir, la información de la variable se almacena en una dirección de memoria diferente al recibirla en el subprograma.
   - Ejemplo en Pascal:
     ```C
      procedure RestarPorValor(a, b: Integer; var resultado: Integer);
      begin
          resultado := a - b;
      end;
     ```
   - En este caso, `a` y `b` se pasan por valor, y `resultado` se pasa por referencia (mediante el modificador `var`).

2. **Parámetros por Referencia**
Son los parámetros precedidos por VAR ( Tambien se les denomina parametros de variables):
   - Cuando se pasa un parámetro por referencia, el subprograma recibe **exactamente la misma dirección de memoria** que la variable original.
   - Cualquier modificación realizada en el valor del parámetro dentro del subprograma afectará directamente a la variable original en el programa principal.
   - Es decir, ambos apuntan al mismo lugar en memoria.
   - Ejemplo en Pascal:
     ```C
     procedure RestarPorReferencia(var a, b: Integer; var resultado: Integer);
     begin
         resultado := a - b;
     end;
     ```
   - Aquí, tanto `a` como `b` se pasan por referencia.

### En resumen:
- **Por valor**: Se envía una copia del valor, sin afectar la variable original.
- **Por referencia**: Se pasa el mismo valor, modificando directamente la variable original⁴⁶⁷.
