program pra3Ej11;
var
  inptN, inptD , millar, centena, decena , unidad : integer;

begin
  (* Entrada de datos *)
  write('Ingrese un numero entero de 4 digitos: ');
  readln(inptN);
  write('Ingrese un numero entero de 1 digito: ');
  readln(inptD);
  writeln();

  (* Descomposión del número N *)
  millar := inptN DIV 1000; // 1.234
  centena := (inptN DIV 100) MOD 10; // 12.34 ~ 12 mod 10 = 2
  decena := (inptN DIV 10) MOD 10; // 123.4 ~ 123 mod 10 = 3 
  unidad := inptN mod 10;

  (* Muestro el numero N ingresado *)
  writeln(inptN:2);

  (* Buscar si existe coincidencia numerica entre D y N, y si la hay en que posicion *)
  if (inptD = millar) then
    write('+')
  else
    write('':1);

  if (inptD = centena) then
    write('+')
  else
    write('':1);

  if (inptD = decena) then
    write('+')
  else
    write('':1);

  if (inptD = unidad) then
    write('+')
  else
    writeln('':1);

  if (inptD <> millar ) and (inptD <> centena ) and (inptD <> decena ) and (inptD <> unidad ) then
    write(inptD:0, ' no aparece en ', inptN:0);

end.  

{
  NOTA:
  
  Se utilia el condicional IF y no el CASE debido a que este ultimo solo admiten costantes,
    en este caso millar, centena, decena y unidad no son contantes, son variables.
}