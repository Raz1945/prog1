program prac6Ej2c;
var
  letterSelected, letter, nextLetter : char;
  i, j : integer;
Begin
  write('Ingrese el caracter elegido: ');
  read(letterSelected);
  write('Ingrese la oracion: ');

  i := 0;
  j := 0;
  repeat
    read(letter);

    // Deben contener la letra una sola vez, entonces en las proximas letras no puede haber coincidencia con el caracter elegido, 
    // hasta llegar a un '.' o espacio en blanco.
    if (letter = letterSelected) then
    begin
      repeat 
        read(nextLetter);
        
        if (nextLetter = letterSelected ) then
          j := j + 1;
      until (nextLetter = ' ') or (nextLetter = '.');
        
      if ( j = 0 ) then 
        i := i + 1;

      j := 0; // actualizo el valor de j
    end;
    
  until (letter = '.') or (nextLetter = '.');

  writeln('La oracion tiene', i:2, ' palabras que contienen la ',letterSelected);
End.

// ejemplo:
// --> a
// --> palabras que contengan una unica vez la letra a.
//     X            1         2   3         4  5     6 

// La oracion tiene 6 palabras que contienen la a