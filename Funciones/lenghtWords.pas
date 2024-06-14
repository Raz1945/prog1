program lenghtOfWord;
var
  letraActual : char;
  i : integer;

Begin
  write('Ingrese una palabra: ');
  i := 0;
  while (eoln = false) do
  begin
    read(letraActual);
    if ( letraActual <> ' ') then
      i := i + 1;

    writeln(letraActual);
  end;

  writeln('Cantidad de letras :', i:2);
End.