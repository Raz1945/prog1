program prac4Ej11;
var
  n, m, res1, res2, maximo : integer; 
begin
  write('Ingrese un valor para m: ');
  readln(m);
  
  write('Ingrese un valor para n: ');
  readln(n);

  if (m <= n) then 
  begin
    (* Dado f(x)= x^2 -18x +5 *)
    res1 := sqr(m) - 18*m + 5; 
    res2 := sqr(n) - 18*n + 5; 

    writeln('res1: ', res1:2);
    writeln('res2: ', res2:2);

    if (res1 >= res2) then 
      maximo := res1
    else 
      maximo := res2;
      
    writeln('El valor máximo para x en el entorno de ', m:2, ' a ', n:2, ' es: ', maximo:2);
  end
  else 
    writeln('El valor de m debe ser menor o igual que n.');
end.
