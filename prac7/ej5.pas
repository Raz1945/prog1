program prac7Ej5;
var
  a, b, c : integer;

procedure corrimiento(var a, b, c :integer);
var
  x, y, z : integer; // auxiliares
begin
  x := c;
  y := a;
  z := b;

  a := x;
  b := y;
  c := z;
  // writeLn('corrimiento:',a:2, b:2, c:2);
end;

begin
  writeLn('Ingrese tres numeros:');
  readln(a, b, c);
  corrimiento(a, b, c);
  writeLn('El corrimiento es:',a:2, b:2, c:2);
end.
