program prac4Ej4;
var
  a, b, n : integer;
  i, result : integer; 
begin
  writeln('Ingrese los valores de a, b y de n: ');
  readln(a, b, n);

  result := 0;
  for i := a to b do
    begin
      result := i MOD n;

      if (result= 0) then
        write(i:2,'':2)
    end;
end.