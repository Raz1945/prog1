{
  Batalla Naval
  Flota:
    - Submarinos [4],
    - Cruceros [3],
    - Acorazados [2],
    - Destructores [1],
}

CONST 
  tam = 10;
  ERRADO = '#'; { Representa un tiro fallido }
  ACERTADO = '*'; { Representa un tiro acertado }
  MAR = '-'; { Representa el mar}

TYPE
  fila = 1..tam;
  columna = 1..tam;
  tablero = ARRAY [fila, columna] of char;

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
