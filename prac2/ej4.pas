program Char_Ord;
var
  a, b, c, d : char;
  r1, r2, resu : real;
begin
  read(a, b, c, d);
  write('a: ', a, ' b: ',b, ' c: ',c, ' d: ',d);
  r1 := ord(a) - ord('0');
  r2 := (ord(c) - ord('0')) * 10 + (ord(d) - ord('0'));
  resu := r1 + r2 / 100;
  writeln ('Valor ingresado: ', resu:4:2)
end.

{ 
  a: 3 b: . c: 1 d: 4 
  Valor ingresado: 3.14
}