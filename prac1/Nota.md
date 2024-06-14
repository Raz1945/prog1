# Compilación del programa fuente
Ahora invocamos el compilador

_C:\PROG1\PRUEBA> fpc -Co -Cr -gl -Miso hola.pas_
....
....
C:\PROG1\PRUEBA>
fpc es el nombre del compilador Free Pascal.
hola.pas es el nombre del archivo que contiene el programa fuente
-Co -Cr son opciones que le indican al compilador que debe generar el control de rangos, desborde de operaciones aritméticas. Es muy importante que indique estas opciones, para asegurarse que sus programas ejecutan sin estos errores.
-gl esta opción hace que el compilador devuelva la línea del código fuente donde se produce el error de ejecución.
-Miso esta opción hace que el compilador se comporte más parecido al Pascal usado en el libro del curso.
Importante: Las opciones del compilador son "case sensitive" (sensibles a la diferencia entre minúsculas y mayúsculas). Por lo tanto el compilador no las interpreta adecuadamente si se pone por ejemplo: -co -cr -miso -gl, o -CO -CR -MISO -GL, o -cO -CR -miso -gL, etc. Lo correcto es usar: -Co -Cr -Miso -gl

Suponemos que el compilador no da ningún mensaje de error. Verificamos que se haya generado el programa ejecutable:

C:\PROG1\PRUEBA> dir
 ...
 ...   hola.exe
 ...   hola.o
 ...   hola.pas
 ...
C:\PROG1\PRUEBA>
Los archivos hola.o y hola.exe fueron creados por el compilador. El primero lo podemos borrar ya que no nos resultará muy útil por el momento. El segundo es el programa ejecutable.

Si el compilador emite mensajes de error, debemos volver a editar el archivo fuente y compilar nuevamente, hasta que no haya errores.

# Ejecución
Ahora podemos ejecutar el programa hola.exe, resultado de la compilación

En la línea de comandos, escribimos hola y damos enter:

C:\PROG1\PRUEBA> hola
Hola, gente.
C:\PROG1\PRUEBA>
El mensaje Hola, gente es el resultado de la ejecución del programa. El mismo termina, y vuelve a aparecer la etiqueta C:\PROG1\PRUEBA> que indica que el sistema está esperando un nuevo comando.

Si el programa no se comporta de la manera esperada, hay que corregir el código fuente, volviendo a editar el archivo que lo contiene e iniciando nuevamente el ciclo: edición/compilación/ejecución


# Errores 
_Sintaxis_ : Significa que hay algo sintaticamente invalido (mal escrito) --> no compila 

_bug_ : es un error en tiempo de ejecucion