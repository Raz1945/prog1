program prac9Ej8;
  { Lee un arreglo de dígitos e imprime el entero equivalente. }  

const
  N = 5; {valor mayor estricto a 1 }
type
  Digito = '0'..'9';
  Digitos = array[1..N] of Digito;

var
  A : Digitos;

procedure leerArreglo(var a:Digitos);
var
  i : integer;
begin
  for i := 1 to N do
    begin
      write('Ingrese el valor de la posicion [i:',i:2,'] : ');
      readln(a[i]);
    end;
end;

function conversion(a:Digitos):integer;
var
  i, intDigit, result : integer;
  leadingZero : boolean;
begin
  result := 0;
  leadingZero := true; { indica que estamos al principio y podemos tener ceros a la izquierda }


  for i := 1 to N do
  begin
    intDigit := Ord(a[i]) - Ord('0'); { convierto el caracter a su respectivo numero entero }
    
    if (intDigit <> 0) or  (not leadingZero) then
    begin
      result := result * 10 + intDigit; { Añade el dígito al resultado }
      leadingZero := false; { Una vez que encontramos un dígito distinto de cero, dejamos de ignorar los ceros iniciales }
    end;
  end;
  conversion := result;
end;

{ Programa Principal }
begin
  writeln('Ejercicio 8');
  writeln('Ingrese el arreglo a convertir: ');
  leerArreglo(A);
  writeln('El entero equivalente es: ', conversion(A):N);   
end.
