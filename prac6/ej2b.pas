program prac6Ej2b;
var
  letterSelected, letter, prevLetter, nextLetter : char; 
  i : integer;

Begin
  write('Ingrese la letra elegida: ');
  readln(letterSelected);
  write('Ingrese una oracion: ');

  i := 0;
  repeat
    read(letter); // 1ra caracter ingresado.
    prevLetter := ' ';

    { Verifico que el caracter ingresado coicida con las condiciones para que sea el caracter del comienzo de una palabra.
      - No debe de tener caracteres previos a no ser el ' ',
      - Debe de coicidir con el caracter elegido. }
    if not (prevLetter in ['0'..'9', 'A'..'Z', 'a'..'z']) and (letter = letterSelected) then
      begin
        (* Si coincide, suma uno a i*)
        i := i + 1;
        writeln('--> i:',i:2);
      end
    else
      begin
        (* Si no coicide, lee los siguientes caracteres de la palabra hasta encontrar espacio, para cambiar de palabra. O un '.' para finalizar la oracion. *)
        repeat
          read(nextLetter);
        until (nextLetter = ' ') or (nextLetter = '.');
      end;

    prevLetter := letter; // actualiza el caracter previo.
  until (letter = '.') or (nextLetter = '.');

  writeln('La oracion tiene', i:2, ' palabras que comienzan con ',letterSelected);
End.