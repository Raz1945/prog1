# Read ~ Readln

**Tipos de datos que admiten _Read_ y _ReadLn_ :**

- Enteros: Números sin decimales, como 1, 2, 3, etc. Se leen con read(variable).
- Reales: Números con decimales, como 1.5, 2.718, etc. Se leen con read(variable).
- Caracteres: Letras, números especiales o símbolos, como 'a', 'B', '$', etc. Se leen con read(variable).
  - Cadenas: Secuencias de caracteres, como "Hola mundo". Se leen con readln(variable).
  - 
**Funciones:**
- *Read*:
  - La función `Read` se utiliza para leer un solo valor del tipo especificado desde la entrada estándar (generalmente el teclado).
  - No incluye el carácter de fin de línea (retorno de carro o salto de línea) al final de la entrada. Es decir, después de leer el valor, el cursor permanece en la misma línea.
  - Puedes usar `Read` para leer datos de diferentes tipos, como caracteres, enteros, números reales o cadenas de texto.

- *ReadLn*:
  - Lee un solo valor del tipo especificado.
  - A diferencia de `Read`, `ReadLn` incluye el carácter de fin de línea `<eoln>`, al final de la entrada. 
    Esto significa que la próxima proposición de `Read` o `ReadLn` procesará los datos a partir del principio de la siguiente línea de entrada, descartando así cualquier valor que haya quedado sin utilizarse en la última línea procesada, incluyendo el carácter de fin de línea.

**Ejemplo:**
Supongase que la entrada aparecen las siguientes constantes enteras, organizadas en lineas, como se muestra:

  5  6  9  3<eoln>
  1  4  7  2<eoln>
  8<eoln>

y se tienen las siguientes proposiciones:
```C#
  read(x,y); { x=5, y=6 }
  readln(z); { z=9, termina la linea }
  readln(s,t);{ s=1, t=4, termina la linea }
  read(w); { w= 8 }
```
