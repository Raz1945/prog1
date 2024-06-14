program Pendulo;
const 
  pi: real = 3.14;
  g: real = 9.8;
var
  l_input, t : real;
begin
  
  writeLn('Ingrese un valor para la longitud:');
  readLn(l_input);

  t := 2 * pi * sqrt (l_input/g);

  writeLn('La longitud del pendulo es:', l_input:0:2);
  writeLn('El periodo del pendulo es:', t:0:2);
end.
