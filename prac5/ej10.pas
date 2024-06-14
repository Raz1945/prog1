program prac5Ej10;
var
  numero, n, m, total, potencia, val: integer;

function getPotencia(a, exponente: integer): integer;
var
  resultado, i: integer;
begin
  resultado := 1;
  for i := 1 to exponente do
    resultado := resultado * a;

  getPotencia := resultado; 
end;

begin
  writeln('Ingrese un numero natural positivo: ');
  readln(numero);

  if numero < 0 then
    writeln('El numero ingresado debe ser un numero natural y positivo')
  else
  begin
    n := 0;
    m := 0;

    repeat
      n := n + 1;
      potencia := getPotencia(2, n);
      m := ((numero div potencia) - 1) div 2;
      val := 2 * m + 1;
      total := potencia * val;
    until numero = total;

    writeln('val:', val:2);
    writeln('potencia:', potencia:2);
    writeln('total:', total:2);
    writeln(numero:2,' = 2^',n:1,' *',val:2);
  end;
end.
