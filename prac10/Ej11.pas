program prac10Ej11;

type
  Complejo = record
                  re, im: real;
  end;

var
  re1, re2, re3: Complejo;

procedure mostrarComplejo(c: Complejo);
begin
  if c.im >= 0 then
    writeln(c.re:2:2, ' + ', c.im:2:2, 'i')
  else
    writeln(c.re:2:2, ' - ', abs(c.im):2:2, 'i');
end;

procedure leerComplejos(var c1, c2: Complejo);
begin
  writeln('Ingrese el primer numero complejo: ');
  write('Parte real: ');
  readln(re1.re);
  write('Parte imaginaria: ');
  readln(re1.im);
  writeln;

  writeln('Ingrese el segundo numero complejo: ');
  write('Parte real: ');
  readln(re2.re);
  write('Parte imaginaria: ');
  readln(re2.im);
  writeln;

end;

procedure sumaComplejos(c1, c2: Complejo; var c3: Complejo);
begin
  c3.re := c1.re + c2.re;
  c3.im := c1.im + c2.im;
end;

procedure multComplejos(c1, c2: Complejo; var c3: Complejo);
begin
  c3.re := c1.re * c2.re - c1.im * c2.im;
  c3.im := c1.im * c2.re + c1.re * c2.im;
end;

{ Programa Principal }
begin
  leerComplejos(re1, re2);

  writeln('Primer numero complejo: ');
  mostrarComplejo(re1);

  writeln('Segundo numero complejo: ');
  mostrarComplejo(re2);
  writeln;

  sumaComplejos(re1, re2, re3);
  writeln('Suma: ');
  mostrarComplejo(re3);
  writeln;

  multComplejos(re1, re2, re3);
  writeln('Producto: ');
  mostrarComplejo(re3);
end.
