program prac7Ej6;
var
  a, b, c : integer;
  cant : integer;
  raiz1, raiz2 : real;

procedure raices(a,b,c : integer; cant : integer; raiz1, raiz2 : real);
var
  discrim : real;

begin
  discrim := sqr(b) -4*a*c;
  writeLn('discriminante:', discrim:2:2);

  if discrim > 0 then
  begin
    cant := 2;
    raiz1 := (-b + sqrt(discrim)) / (2 * a);
    raiz2 := (-b - sqrt(discrim)) / (2 * a);      
    writeln('Resultado: ', 'cant:', cant:0,' raiz1: ', raiz1:2:2, ' raiz2: ', raiz2:2:2);
  end
  else if discrim = 0 then
  begin
    cant := 1;
    raiz1 := -b / (2 * a);
    writeln('Resultado: ', 'cant:', cant:0,' raiz1: ', raiz1:2:2, ' raiz2: ?')
  end
  else { Raices imaginarias }
    begin
      writeLn('Raices Imaginarias');
      cant := 0;
      // raiz1 := (-b + sqrt(-discrim)) / (2 * a);
      // raiz2 := (-b - sqrt(-discrim)) / (2 * a);
      writeln('Resultado: ', 'cant:', cant:0,' raiz1: ?', ' raiz2: ?')
    end;
end;

Begin
  cant := 0;
  raiz1 := 0;
  raiz2 := 0;
  writeLn('Entrada: ');
  readln(a, b, c);
  writeLn('');{ Salto de linea}

  raices(a, b, c, cant, raiz1, raiz2);
End.
