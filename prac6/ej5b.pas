program prac6Ej5;
var
  k, i, max, sig : integer;
Begin
  write('Ingrese k: ');
  read(k);

  max := k div 2; // El maximo divisor posible

  writeln('Secuencia de cuadrados: ');
  sig := 0;
  for i := 0 to (max) do
  begin
      sig := Sqr(i + 1);
      write(sig:2, ' ');
  end;
End.
