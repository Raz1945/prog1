# Tarea

## Programa principal

El programa principal procesa un texto con al menos una palabra y obtiene: la cantidad de
palabras del texto, el largo de la palabra más larga y el largo de la palabra más breve.

## Procedimientos a implementar

Se debe implementar dos procedimientos, **leePalabraLargo** y **leerOracionDatos** que seran invocados por 
el programa principal para leer una oracion y calcular las metricas mencionadas. 

**Procedimiento leerPalabraLargo.**
```C#
  procedure leerPalabraLargo ( var largo : integer ; var fin : boolean);
```
Lee de la entrada estándar una palabra, es decir, una cadena de caracteres terminada en SEPARADOR o FINALIZADOR.
- retorna en el parámetro de salida _largo_, el largo de la palabra (sin contar al SEPARADOR o FINALIZADOR). 
- retorna en el parámetro de salida _fin_ un booleano que indica si el último caracter es FINALIZADOR o no. 

_Asumir que el largo de la palabra es mayor o igual que uno._

{ NOTA: Un procedimiento no retorna un valor directamente. }


**Procedimiento leerOracionDatos.**
```C#
  procedure leerOracionDatos (var cantPalabras, masLarga, masCorta : integer);
```
Lee de la entrada estándar una oración compuesta de palabras separadas por un carácter SEPARADOR, que finaliza con el caracter FINALIZADOR.

Retorna en el parámetro de salida: 
- _cantPalabras_ la cantidad de palabras de la oración,
- _masLarga_ la cantidad de letras de la palabra más larga, 
- _masCorta_ la cantidad de letras de la palabra más corta.
 
_Asumir que la oración tiene al menos una palabra._
_Notar_ que para implementar este procedimiento se debe invocar al procedimiento leerPalabraLargo.


### Definiciones 
```C#
  const
    SEPARADOR   = ' ';   { caracter que separa palabras }
    FINALIZADOR = '.';   { caracter que determina fin de oración }
```

# Como ejecutar los casos de prueba de la Tarea 1
Ver [Link](https://eva.fing.edu.uy/mod/page/view.php?id=195047)


**Conexcion al servidor**
ssh -l gonzalo.sanchez pcunix90.fing.edu.uy