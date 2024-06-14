program SumaReales;
var
  numero, total : real;
Begin
  read(numero);

  total := 0;
  repeat
    total := total + numero;
    read(numero);
    until (numero < 0);
  writeln('Total: ', total:2:2);

End.