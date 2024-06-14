PROGRAM batallaNaval;
// {$INCLUDE Flota.pas}

CONST 
  tam = 10;
  ERRADO = '#'; { Representa un tiro fallido }
  ACERTADO = '*'; { Representa un tiro acertado }


TYPE
  fila = 1..tam;
  columna = 1..tam;
  tablero = ARRAY [fila, columna] of char;

VAR
  marJ1: tablero;
  marJ2: tablero;
  i, j: integer;
  esValido : boolean;

{ Inicializa el tablero }
procedure crearTablero(VAR t: tablero);
  begin
    for i := 1 to tam do
      for j := 1 to tam do
        t[i, j] := '-'; { '-' representa el mar}
  end;

{ Imprime el tablero }
procedure mostrarTablero(t: tablero);
  var
    i, j: integer;
    letra: char;

  begin
    if esValido = true then 
    begin
      { Imprimir encabezado de columnas }
      write(' ':3);  { Espacio para la primera columna con una 'sangria' de 3 }
      for j := 1 to tam do
        write(j:3);
      writeln;

      { Imprimir encabezado de filas }
      letra := 'A';
      for i := 1 to tam do
      begin
        write(letra:3); 
        for j := 1 to tam do
          write(t[i, j]:3);
        writeln;
        letra := succ(letra); { Avanza al siguiente carácter }
      end;
    end;
  end;

{ Submarino }
procedure colocarSubmarino(var t: tablero; fila, columna : integer);
  begin
    if (fila >= 1) and (fila <= tam) and (columna >= 1) and (columna <= tam) then
      t[fila, columna] := 'S' { 'S' representa submarino}
    else
    begin
      writeln('La posicion del submarino en [',fila:2,', ', columna:2,'] no es valida.');
      esValido := false;
    end;
  end;
{ Crucero }
procedure colocarCrucero(var t: tablero; fila, columna: integer);
  var
    i: integer;
  begin
    if (fila >= 1) and (fila <= tam) and (columna >= 1) and ((columna + 1) <= tam) then
    begin
      for i := columna to (columna + 1) do
        t[fila, i] := 'C'; { 'C' representa un crucero }
    end
    else
    begin
      writeln('La posicion del crucero en [',fila:2,', ', columna:2,'] no es valida.');
      esValido := false;
    end;
  end;



{ Programa Principal }
BEGIN
  esValido := true; { declaro que es valido como predeterminado }

  { Creación del Tablero }
  writeln('':8,'*** Batalla Naval ***');
  crearTablero(marJ1);
  crearTablero(marJ2); 

  writeln;

  { Comienzo del turno del Jugador 1 }
  writeln('Jugador 1 ');
  writeln('Indique la posicion de la flota');
  colocarSubmarino(marJ1, 2, 3);
  // colocarSubmarino(mar, 2, 11); // Posicion invalida
  colocarCrucero(marJ1, 1, 4);
  // colocarCrucero(mar, 1, 10); // Posicion invalida
  mostrarTablero(marJ1);

  writeln;

  { Comienzo del turno del Jugador 2 }
  writeln('Jugador 2 ');
  colocarSubmarino(marJ2, 5, 7);
  colocarCrucero(marJ2, 4, 4);
  mostrarTablero(marJ2);

END.
