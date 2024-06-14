program prac5Ej9;
var
  numero, desvEstandar, i, a : real;
  totalSuma, s : real;

Begin
  writeln('Ingrese a continuacion los numeros para el calculo de la desviacion estandar.');
  writeln('Finalice con un numero negativo para enviar los datos.');
  read(numero);

  i:= 0;
  totalSuma := 0; 
  a := 0;
  s := 0; 
  desvEstandar := 0;
  repeat
    totalSuma := totalSuma + numero;
    i := i + 1;
    a := totalSuma / i;
    s := s + sqr(numero);
    desvEstandar := sqrt( (s / i) - sqr(a));

    read(numero);
  until (numero < 0);

  writeln('El valor de la Desviacion Estandar es: ', desvEstandar:2:2);
End.
