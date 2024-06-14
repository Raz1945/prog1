Program prac6Ej7;

Var
  m, n, i, resultado : integer;

Begin
  write('Ingrese m:');
  readln(m);
  write('Ingrese n:');
  readln(n);

  writeln(''); // Salto de linea 
  if (m <= n) then
  begin
    while (m <= n) do
    begin
      writeln('>>> Tabla ',m:2,' <<<');

      resultado := 0;
      for i := 1 to 10 do
      begin
        resultado := i * m;
        writeln(i:2, ' *', m:2, ' = ', resultado:2);
      end;
      writeln(''); // Salto de linea 
      m := m + 1;
    end;
  end;
End.
