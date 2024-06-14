program prac4Ej6;
var
  n, i, num: integer;
  mayor, menor: integer;

begin
  write('Ingrese un valor para n: ');
  read(n);
  
  writeln('Ingrese ', n:2, ' enteros: ');

  (* Lee el primer ingreso para inicializar las variables de comparación *)
  read(num);
  mayor := num;
  menor := num;

  (* Continúa leyendo los restantes n-1 números *)
  for i := n downto 2 do 
  begin
    read(num);

    (* Verifica si el 'num' ingresado es mayor o menor *)
    if num > mayor then 
      mayor := num
    else if num < menor then
      menor := num;
  end;

  writeln('El mayor entero ingresado es: ', mayor:2);
  writeln('El menor entero ingresado es: ', menor:2);
end.
