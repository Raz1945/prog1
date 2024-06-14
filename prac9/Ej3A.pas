program prac9Ej3A;

{$INCLUDE leerArreglo.pas}

const
  N = 3; { Debe de ser mayor estricto a 1 }

type 
  cadenaN = array [1..N] of integer;

var
  A: cadenaN;
  num : integer;

{ Devuelve los valores almacenados en el arreglo que sean mayores que 'num'}
function cantMayores(cand : cadenaN; num : integer): integer;
var
  i, count : integer;
begin
  count := 0;
  for i := 1 to N do
    if num < cand[i] then
      count := count + 1;
  cantMayores := count;
end;

{ Programa principal }
Begin
  writeln('Ingrese', N:2, ' valores para almacenar en el arreglo.');
  leerArreglo(A, N);

  writeln('Ingrese el valor de num.');
  readln(num);
  writeln('Cantidad de valores mayores que ', num:2, ': ', cantMayores(A, num));

End.
