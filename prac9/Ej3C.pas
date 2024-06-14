program prac9Ej3A;

{$INCLUDE ../prac9/leerArreglo.pas}

const
  N = 3; { Debe de ser mayor estricto a 1 }

type 
  cadenaN = array [1..N] of integer;

var
  A: cadenaN;
  valor, pos: integer;

{ Dado un arreglo de enteros devuelve el valor más grande y su posición. }
procedure maxValorPos(cadn: cadenaN; var valor, pos: integer);
var
  i: integer;
begin
  { Comparo desde la posicion 1 y su valor }
  valor := cadn[1]; 
  pos := 1;

  for i := 2 to N do
  begin
    if cadn[i] > valor then
    begin
      valor := cadn[i];
      pos := i;
    end;
  end;

  writeln('El valor mas grande es: ', valor:2);
  writeln('Se encuentra en el indice: ', pos:2);
end;

{ Programa principal }
begin
  writeln('Ingrese ', N:2, ' valores para almacenar en el arreglo.');
  leerArreglo(A, N);
  maxValorPos(A, valor, pos);
end.
