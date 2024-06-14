program prac6Ej2;
var
  letraElegida, letra, letraSiguiente : char;
  i : integer;

Begin
  write('Ingrese una letra: ');
  readln(letraElegida);
  write('Ingrese una palabra: ');
  i := 0;

  repeat
    read(letra); 
    if (letra = letraElegida) then
    begin
      read(letraSiguiente);
      if (letraSiguiente = ' ') or (letraSiguiente = '.') then
        i := i + 1;
    end;
  until (letra = '.') or (letraSiguiente = '.');

  writeln('La oracion tiene', i:2, ' palabras que termina con ',letraElegida);
End.

