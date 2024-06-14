Program prac6Ej8; 
{
  Muestra los numeros primos que estan dentro del rango ingresado.
}

Var
  m, n, count, i : integer;

Function EsPrimo(num: integer):boolean;
  var
    j : integer;
    primo : boolean;
  begin
    primo := true;
    for j := 2 to Trunc(Sqrt(num)) do
    begin
      if num mod j = 0 then
        primo := false;
    end;

    EsPrimo := primo;
  end;

Begin
  write('Ingrese m:');
  readln(m);
  write('Ingrese n:');
  readln(n);

  writeln(''); // Salto de linea 
  count := 0;
  i := m;
  while (i <= n) and (n - count > 0)do
  begin
    if EsPrimo(i) then
    begin
      writeln(i:2, ' es primo.');
      count := count + 1;
    end;

    i := i + 1;
  end;
End.
