program pra3Ej13;
{
  El programa convierte un numero positivo hexadecimal (de tres digitos) 
  tomado de la entrada estandar en su equivalente en base 10.

  Un digito hexadecimal es uno de los digitos 0 a 9 ó A(10), B(11), C(12), D(13), E(14), o F(15). 

  El equivalente decimal de un numero hexadecimal de la forma abc se calcula como: a × 16^2 + b × 16 + c.

  Su programa debera leer por la entrada estandar el numero hexadecimal y realizar las operaciones 
  aritmeticas necesarias para calcular el numero equivalente en base 10.
}

var
  a, b, c: char;
  decimalValue, centena, decena, unidad : integer;

(* Obtener un numero hexadecimal *)
procedure getData(var a, b, c: char);
begin
  write('Ingrese un numero positivo hexadecimal de 3 cifras: ');
  readln(a, b, c);
end;

begin
  getData(a, b, c); (* Invoca el procedimiento para obtener datos *)

  (* Validacion de los datos de entrada *)
  if not ((a in ['0'..'9', 'A'..'F', 'a'..'f']) and
          (b in ['0'..'9', 'A'..'F', 'a'..'f']) and
          (c in ['0'..'9', 'A'..'F', 'a'..'f'])) then
    writeln('Al menos uno de los caracteres no es un dígito hexadecimal válido')
  else
  begin
    (* Calcula el valor decimal *)
    case a of
      '0'..'9': centena := ord(a) - ord('0');
      'A'..'F', 'a'..'f': centena := ord(a) - ord('A') + 10; // Se resta la ord('A') al valor de ord(a) para obtener la distancia entre el carácter a y la letra 'A', y se suma 10 para obtener el decimal
    end;

    case b of
      '0'..'9': decena := ord(b) - ord('0');
      'A'..'F', 'a'..'f': decena := ord(b) - ord('A') + 10;
    end;

    case c of
      '0'..'9': unidad := ord(c) - ord('0');
      'A'..'F', 'a'..'f': unidad := ord(c) - ord('A') + 10;
    end;

    decimalValue := centena * sqr(16)  + decena * 16 + unidad;

    writeln('El equivalente decimal de ', a, b, c, ' es ', decimalValue:2);
  end;
end.

{
  # Como pasar de Char -> Integer

  La posicion ordinal de cualquier entero es igual al entero mismo,
  se tiene que hacer lo siguiente:
    Char -> Integer : ord(digito) - ord('0') // El valor entero de un digito, es igual a su distancia desde el '0' 

  Ejemplo:
  5 = ord('5') - ord('0')
  5 = 53 - 48 

  # Integer -> Char : chr(val + ord('0'))

  Ejemplo:
  '5' = char(5 + ord('0'))
}