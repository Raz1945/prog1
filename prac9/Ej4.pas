PROGRAM pract9Ej4;

CONST 
  max = 2;

TYPE
  fila = 1..max;
  columna = 1..max;
  tablero = ARRAY [fila, columna] of integer;

VAR
  t, t_traspuesta: tablero;
  i, j, num: integer;

procedure crearTablero(var t : tablero);
var
  i, j: integer;
begin
  for i := 1 to max do
    for j := 1 to max do
    begin
      write('Ingrese el valor de la posicion [i:',i:2,',j:',j:2,'] : ');
      readln(t[i,j]);
    end;
end;

procedure mostrarTablero(t : tablero);
var
  i, j: integer;
begin
  for i := 1 to max do
  begin
    for j := 1 to max do
    begin
      write(t[i,j]:3);
    end;
    writeln;  // Mover a la siguiente línea después de imprimir una fila completa
  end;
end;

procedure transponerTablero(t: tablero; var t_traspuesta : tablero);
var
  i, j : integer;
begin
  for i := 1 to max do
    for j := 1 to max do
      t_traspuesta[j, i] := t[i, j];
end;

procedure cambiarValor(var t: tablero; i, j, num : integer);
begin
  if (i >= 1) and (i <= max) and (j >= 1) and (j <= max) then
  begin
    t[i,j] := num;
  end
  else
  begin
    writeln('Indices fuera de rango.');
  end;
end;

Begin
  crearTablero(t);
  writeln('Tablero original:');
  mostrarTablero(t);
  writeln;

  transponerTablero(t, t_traspuesta);
  writeln('Tablero traspuesto:');
  mostrarTablero(t_traspuesta);
  writeln;

  write('Ingrese los indices y el nuevo valor (i j num): ');
  readln(i, j, num);
  
  cambiarValor(t, i, j, num);
  writeln('Tablero despues de cambiar el valor:');
  mostrarTablero(t);
End.
