program OctaNumber;
{
  El programa transforma un numero octal (base ocho) de tres digitos en su correspondiente 
  nuumero equivalente en base 10. 

  Por ejemplo, el numero octal de tres digitos 415 equivale al valor decimal de 269

  415 -> (4 × 8^2) + (1 × 8^1) + (5 × 8^0) = 69
}
var
  octal, decimal : integer;

(* Calcula el numero Decimal de un numero Ocal*)
function getDecimalNumber(num: integer):integer;
var 
  num0, num1, num2: integer;
begin
  num0 := num div 100; (* 'DIV' solo toma la parte entera *)
  num1 := (num mod 100) div 10; (* 415 MOD 100 = 15 -> 15 DIV 10 = 1 *)
  num2 := num mod 10; (* 415 MOD 10 = 5 *)

  getDecimalNumber := (num0 * sqr(8)) +(num1 * 8) + (num2) ;
end;

begin
  (* Entrada *)
  write('Introduzca un numero de tres digitos: ');
  read(octal);

  (* Calculo de su numero decimal *)
  decimal := getDecimalNumber(octal);

  (* Salida *)
  writeln('Octal: ',octal:2,'':2 ,'Decimal: ', decimal:2);
end.
