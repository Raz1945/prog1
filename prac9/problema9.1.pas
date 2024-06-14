program problema9punto1;

Type lista = Array [-10 .. 10] Of char;

Procedure copiar(var puntos, temp : lista);
var
  indice : -10 .. 10;
begin
  for indice := -10 to 10 do
    temp[indice] := puntos[indice];
end;

Var
  puntos, temp : lista;
  i : 0 .. 10; // Establece un subrango para la variable.
Begin
  { Llena el arreglo 'puntos' con letras desde la 'A' hasta la 'K' }
  for i := 0 to 10 do
    puntos[i] := chr(ord('A') + i);
  
  { Llama al procedimiento 'copiar'}
  copiar(puntos, temp);

  { Muestra los datos copiados en 'temp'}
  writeln('Datos copiados en temp:');
  for i := 0 to 10 do
    writeln('temp[',i:2,'] = ', temp[i]);
End.
