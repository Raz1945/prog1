program prac5Ej11;
var
  n, b, k, potencia: integer;

function getPotencia(base, exponente : integer):integer;
var
  i, resultado : integer;
begin
  resultado := 1;
  for i := 1 to exponente do
    resultado := resultado * base;

  getPotencia := resultado;
end;
Begin
  write('Ingrese un numero: ');
  readln(n);
  write('Ingrese base: ');
  readln(b);

  k := 0;
  repeat
    k := k + 1;
    potencia := getPotencia(b, k);
  until potencia = n;
  writeln('Potencia: ', potencia:2);
  writeln('Resultado:', k:2);
End.