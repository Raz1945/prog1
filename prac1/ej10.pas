// program Muestra1;
// const 
//   pi:real = 3.1415926535;
//   r1:real = 2.0;
//   r2: real = 5.0;

// var 
//   area: real;

// begin
//   area := pi * sqr(r1);
//   writeLn(r1, area); 
//   area := pi * sqr(r2);
//   writeLn(r2, area);
// end.

program Muestra2;
const 
  medio = 0.5;
var
  num :real;
  a, b : integer;
begin
  writeLn('Ingrese un numero');
  readLn(num);
  a := round (num);
  b := trunc (num + medio);
  writeLn(num, a, b);
end.