program prac9Ej3B;

{$INCLUDE ../prac9/leerArreglo.pas}

const
  N = 3; { Debe de ser mayor estricto a 1 }

type 
  cadenaN = array [1..N] of integer;

var
  A: cadenaN;

{ Devuelve 'true' si el arreglo esta ordenado en forma ascendente. }
function ordenado(cadn: cadenaN) : boolean;
var
  i: integer;
begin
  ordenado := true;  { Se asume que está ordenado }

  for i := 1 to N-1 do { 'N-1' es para que no se salga de rango al comparar}
  begin
    if cadn[i] > cadn[i+1] then
      ordenado := false;
  end;
end;

{ Programa principal }
begin
  writeln('Ingrese ', N:2, ' valores para almacenar en el arreglo.');
  leerArreglo(A, N);

  if ordenado(A) then
    writeln('El arreglo esta ordenado ascendentemente.')
  else
    writeln('El arreglo no esta ordenado');
end.
