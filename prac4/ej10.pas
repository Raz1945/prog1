program prac4Ej10;
var
  n, i , factor : integer;

Begin
  write('Ingrese un valor para n: ');
  readln(n);

  factor := 1;
  for i := n downto 1 do
    factor := factor * i;
    
  writeln('El factorial de',n:2,' es: ',factor:2)
End.