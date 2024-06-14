program prac4Ej9;
var
  x, exponente, i, potencia : integer;

Begin
  write('Ingrese un valor para x: '); 
  readln(x);
  
  write('Ingrese un valor para el exponente: '); 
  readln(exponente);

  potencia := 1; 
  for i := 1 to exponente do 
  begin
    potencia := potencia * x ;
    writeln('valor de potencia: ', potencia:2);
  end;

  writeln('El resultado de', x:2, ' elevado a la', exponente:2, ' es: ', potencia:2);
End.