program MayorAndMenor;
var
  num, mayor, menor : integer;
Begin
  write('Ingrese un numero: ');
  readln(num);

  mayor := num;
  menor := num;

  while (num <> -1) do 
  begin
    write('Ingrese un numero: ');
    read(num);

    if num >= mayor then 
      mayor := num
    else if (num < menor) and (num > 0) then
      menor := num;
  end;

  writeln('El mayor numero ingresado es:', mayor:2);
  writeln('El menor numero ingresado es:', menor:2);
End.