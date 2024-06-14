## Funciones `ord` y `chr` en Pascal

**Introducción:**

Las funciones `ord` y `chr` son herramientas fundamentales para trabajar con cadenas de caracteres en Pascal. Te permiten convertir entre caracteres y sus códigos ASCII, abriendo un mundo de posibilidades para la manipulación de texto.

**Aplicaciones:**

* Conversión entre caracteres y códigos ASCII.
* Comparación de caracteres.
* Búsqueda y reemplazo de caracteres en cadenas.
* Manipulación de cadenas de texto.

# Funcion `ord`:
* **Descripción:** Devuelve el código ASCII de un carácter.

* **Ejemplo:**
```C#
  var
    caracter: char;
    codigo: integer;
  begin
    caracter := 'A';
    codigo := ord(caracter);
    writeln('El código ASCII de la letra A es: ', codigo);
  end.

  //SALIDA:  El código ASCII de la letra A es: 65
```

## Convertir un cacarter en su entero correspondiente:
* **Ejemplo:**
```C#
  charDigit := '0';  { Carácter que quiero convertir, ejemplo '0' a 0 }
  
  intDigit := Ord(charDigit) - Ord('0'); { convierto el caracter a su respectivo numero entero }
```

# Funcion `chr`
* **Descripción:** Devuelve el carácter que corresponde a un código ASCII.

* **Ejemplo:**
```C#
  var
    caracter: char;
    codigo: integer;
  begin
    codigo := 65;
    caracter := chr(codigo);
  
    writeln('El carácter que corresponde al código ASCII 65 es: ', caracter);
  end.

  // Salida: El carácter que corresponde al código ASCII 65 es: A
```
