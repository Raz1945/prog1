program parc2023; 
var
  n, count, i : integer;
  currentChar, nextChar : char; 
  
Begin
  writeln('Ingrese un valor para n ');
  readln(n);
  writeln('Ingrese los caracteres ');
  read(currentChar); { Lee el primer caracter }

  count := 0;
  for i := 2 to n do  // i := 2; { Comienza la cuenta desde el siguiente caracter }
  begin
    read(nextChar); { lee los siguientes caracteres }
    If currentChar <> nextChar then
      count := count + 1;  
  end;

  writeln('La cantidad de caracteres distintos del primero es ', count:2);
End.
