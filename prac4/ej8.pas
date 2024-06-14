program prac4Ej8;
var
  n, i, j : integer;
  simbolo : char;

procedure Triangulo(n:integer);
begin
  for i := n downto 1 do
  begin
      for j := i downto 1 do
        write(simbolo);
      writeln()
  end;
end;

Begin
  write('Ingrese un caracter: ');
  readln(simbolo);

  write('Ingrese un valor para n: ');
  readln(n);
  Triangulo(n);
End.