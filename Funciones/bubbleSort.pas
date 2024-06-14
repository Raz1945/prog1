{
El Bubble Sort es uno de los algoritmos de ordenamiento más simples 
y es ampliamente utilizado para entender los conceptos básicos de los algoritmos 
de ordenamiento. A continuación, te explico en detalle cómo funciona el Bubble Sort, 
con ejemplos y pseudocódigo.

Concepto Básico
Bubble Sort ordena una lista comparando repetidamente los elementos adyacentes 
y cambiándolos de lugar si están en el orden incorrecto. 
Este proceso se repite hasta que la lista esté ordenada. 
Su nombre se debe a que los elementos más grandes "burbujearán" hacia el final 
de la lista en cada pasada.

Cómo Funciona?
Comparación y Cambio de Lugar:
1 - Comienza desde el principio de la lista.
  - Compara el primer y el segundo elemento.
  - Si el primer elemento es mayor que el segundo, intercámbialos.
  - Luego, compara el segundo y el tercer elemento, y así sucesivamente hasta llegar al final de la lista.

2 - Repetición del Proceso:
  - Repite el proceso para toda la lista.
  - En cada pasada, el mayor de los elementos no ordenados se coloca en su posición correcta.
}

procedure bubbleSort(var l: ListaInt);
var
  current, next: ListaInt;
  temp: integer;
  sorted: boolean;
begin
  if l = nil then
    exit;

  repeat
    sorted := true;
    current := l;

    while current^.sig <> nil do
    begin
      next := current^.sig;
      if current^.info > next^.info then
      begin
        // Intercambia los valores
        temp := current^.info;
        current^.info := next^.info;
        next^.info := temp;
        sorted := false;
      end;
      current := current^.sig;
    end;
  until sorted;
end;
