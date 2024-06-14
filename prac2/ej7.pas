program voila;
{
  ErrorRel = |m - v|/v

  Donde 'm' es la medicion, y 'v' el valor verdadero.
}

var
  medicion, valorV, ErrorRel : Real;
begin
  read (medicion, valorV);
  
  ErrorRel := abs( medicion - valorV)/valorV;

  writeln('Medicion =', medicion);
  writeln('Valor verdadero =', valorV);
  writeln('Error relativo =', ErrorRel);
end.