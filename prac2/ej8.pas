program MetodoCuadradoMedio;
{  # Metodo del cuadrado medio.

  Dado un numero 'a' del tipo entero y de dos digitos, para generar el siguiente numero de la secuencia se
  extraen los digitos que estan en la posicion de las decenas y las centenas de a^2.
    
  Por ejemplo, 
  si a es 53, entonces a^2 es 2809, y el siguiente numero
  seudoaleatorio ser´a 80
}
var
  inputNum, aCuadrado, resultado, seudoNum : integer;

function getSeudoNumero(num : integer):integer;
begin
  aCuadrado := sqr(num);
  
  // Verifico que el cuadrado del numero tenga cuatro digitos 
  if aCuadrado < 1000 then
    resultado := (aCuadrado mod 1000) div 10; 

  // Extrae los digitos de las centenas de de las decenas
  resultado := (aCuadrado mod 1000) div 10; 
  getSeudoNumero := resultado;
end;

begin
  write('Introduzca un numero entero de dos cifras: ');
  read(inputNum);

  // Verifico que el numero ingresado sea de dos digitos
  if (inputNum >= 10 ) and ( inputNum <= 99) then
  begin
    seudoNum := getSeudoNumero(inputNum);

    writeln('Numero inroducido = ', inputNum:2);
    writeln('Cuadrado del numero = ', aCuadrado:2);
    writeln('Siguiente numero seudoaletario = ', seudoNum:2);
  end
  else
    writeln('El numero debe de ser de dos cifras.');
end.
