program prac6Ej5;
var
  k, i, ant, sig, dif : integer;
Begin
  write('Ingrese k: ');
  read(k);

  writeln('Secuencia de cuadrados: ');
  i := 0;
  repeat
    sig := Sqr(i + 1);
    ant := Sqr(i);
    dif := sig - ant;

    write(sig:2, ' ');

    i := i + 1;
  until (dif > k);
End.
