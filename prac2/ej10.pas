program Raiz;
{
  Escriba un programa en Pascal para determinar la raiz cuadrada
  de un numero real positivo a mediante el calculo de a^0,5. 

  El programa debera leer el valor para a por la entrada est´andar.

  --> Sabiendo que: 
                  a^b = exp(b * ln(a))
}
var
  raiz, raizLog, num : real;
begin
  (* Lectura del número real *)
  write('Introduzca un numero: ');
  read(num);

  (* Calculo de la Raiz mediante la expresión de logaritmo *)
  raizLog := exp( 0.5 * ln(num));

  (* Calculo de la Raiz estandar *)
  raiz := sqrt(num);

  (* Salida del resultado *)
  writeLn('Valor introducido: ', num:4:2);
  writeLn('Raiz cuadrada calculada: ', raizLog);
  writeLn('Valor de Sqrt (a): ', raiz);
end.
