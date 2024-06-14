program prac4Ej5;
var
  n, i, result : integer; 
begin
  writeln('Ingrese el valor de n: ');
  readln(n);

  result := 0;
  
  for i := 1 to n do
    begin
      result := n MOD i ;
      if result = 0 then
        write(i:2, '':2)
    end;
end.