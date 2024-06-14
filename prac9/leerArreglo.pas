
{ Asigna valores al arreglo desde la entrada estandar }
procedure leerArreglo(var A: array of integer; N: integer);
var
  i: integer;
begin
  for i := 1 to N do
    readln(A[i]);
end;
