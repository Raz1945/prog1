program NumeroPrimo;

var
  num,divisor, max : integer;

Begin
  write('Ingrese un numero: ');
  readln(num);

  (* Concicion de entrada *)
  if num >= 1 then
  begin
    max := num DIV 2; (* Se puede optimizar aún mas *)
    divisor := 2;

    (* Realiza la busquedad del divisor en el intervalo [2 , n DIV 2] para eficiencia del programa, y se dentrendra cuando lo encuentre. *)
    while ( divisor <= max ) and ( num mod divisor <> 0 ) do
      divisor := divisor + 1;


    (* Teniendo el divisor verifica si el numero es primo siemprre que el divisor es mayor que max *)
    if divisor <= max then
      writeln('El numero ', num:2, ' no es primo')
    else
      writeln('El numero ', num:2, ' es primo')
  end
  else
    write('Ingrese un numero mayor que 1');
End.

{ 
  -> Verifica si un numero es primo.
    Un numero es primo si es mayor que uno y es divisible unicamente por si mismo y por uno.

  -> Optimizar el programa
      Observemos que si num tiene un divisor mayor que num DIV 2,
      entonces también debe tener un divisor menor que num DIV 2 

    max := Trunc(Sqrt(num));  (*Calculamos la raíz cuadrada de num*)
  }
