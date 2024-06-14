{ 
  Fórmula de Herón   
  Á = sqrt(numS * (numS - numA) * (numS - numB) * (numS - numC));

  Condición
  La suma de cualquier par de lados de un triángulo debe ser mayor que el tercer lado.  
}

program Triangulo;
var 
  numA, numB, numC, numS , area : real;
begin
  writeLn('Ingrese a continuacion el valor de a, b y c:');
  readLn(numA);
  readLn(numB);
  readLn(numC);

  writeLn('a = ', numA:0:2);
  writeLn('b = ', numB:0:2);
  writeLn('c = ', numC:0:2);

  (* Se verifica que se cumpla la condicion para un triangulo valido*)
  if (numA + numB > numC) and (numA + numC > numB) and (numB + numC > numA) then
    begin
      numS := (numA + numB + numC) / 2;
      area := sqrt(numS * (numS - numA) * (numS - numB) * (numS - numC));
      writeLn('El area del triangulo es:', area:0:2);
    end
  else
    begin
      writeLn('Error: Los lados ingresados no forman un triangulo valido.');
      writeLn('La suma de cualquier par de lados de un triángulo debe ser mayor que el tercer lado.');
    end;
end.
