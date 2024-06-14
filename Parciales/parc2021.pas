program parc2021;
var
  n,m, suma, prod: integer;
procedure prueba(n,m :integer; var suma, prod : integer);
var
  i : integer;
begin
  suma := 0;
  prod := 1;

  for i := n to m do
  begin
    suma := suma + i;
    prod := prod * i;
  end;
end;

Begin
  n := 2;
  m := 5;
  prueba(n,m, suma, prod);
  writeln('suma', suma:2);
  writeln('prod', prod:2);
End.
