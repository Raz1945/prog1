program prac6Ej3;
var
  x, resultado : real;
  numero: integer;

Begin
  write('Ingrese el valor de x: ');
  readln(x);
  write('Ingrese los coeficientes: ');

  numero := 0;
  resultado := 0;
  while (numero <> -1 ) do
  begin
    read(numero);
    if not (numero = -1) then 
      resultado := (resultado + numero) * x;      
  end;
  resultado := resultado / x;
  writeln('resultado: ',resultado:2:2);
End.