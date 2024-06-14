program VerSumaAndPromedio;
var
  num, suma, prom, i: integer;
Begin
  suma := 0;
  prom := 0;
  i := 1;

  repeat
    write('Ingrese un numero: ');
    readln(num);
    suma := suma + num;
    prom := suma DIV i; 
    i := i + 1;
    
    if not (num = -1) then
    writeln('Suma:',suma:2, ' Promedio', prom:2);
  until (num = -1);
End.