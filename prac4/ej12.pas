program prac4Ej12;
var
  n, x, y, resultado : integer; 
Begin
  write('Ingrese un valor para n: ');
  readln(n);
  
  x := -n;
  y := n;

  resultado := sqr(x) - 9*x*y + sqr(y);

  writeln('El valor maximo para X e Y en el entorno de ',x:2,' a',y:2,' es ',resultado:2)
End.
