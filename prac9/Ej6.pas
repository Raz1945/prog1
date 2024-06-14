program prac9Ej6;
{
  Matriz Traspuesta
  La traspuesta de una matriz cuadrada 'A' es una matriz 'B' del mismo tipo cuyas celdas satisfacen
  la relacion B[i,j] = A[j,i] para todos los valores posilbes de i y j.
}
const
  N = 2; { Valor mayor estricto a 1 }
type
  Matriz = array [1..N, 1..N] of integer;

var
  A, B : Matriz; { Donde B es la matriz traspuesta de 'A' }

{ Calcula la matriz traspuesta si subtituir la original }
procedure traspuestaMatrizAB( A : Matriz; var B : Matriz); 
  var
    i, j : integer;
  begin
    for i := 1 to N do
      for j := 1 to N do
        B[j,i] := A[i,j];
  end;

{ Calcula la matriz traspuesta sutituyendo la original }
procedure traspuestaMatrizA( var A : Matriz); 
  var
    i, j : integer;
  begin
    for i := 1 to N do
      for j := 1 to N do
        A[j,i] := A[i,j];
  end;

procedure mostrarMatriz(t : Matriz);
  var
    i, j : integer;
  begin
    for i := 1 to N do
    begin
      for j := 1 to N do
        write(t[i,j]:3);
      writeln; // Mueve a la siguiente linea 
    end;
  end;

{ Programa Principal }
begin
  writeln('Matriz Traspuesta');
  { Inicializa la matriz A de manera manual }
  A[1,1] := 1; A[1,2] := 2; 
  A[2,1] := 5; A[2,2] := 6;
  
  writeln('Matriz A:');
  mostrarMatriz(A);
  
  traspuestaMatrizAB(A, B); { Ej6 - a}
  writeln('Matriz traspuesta AB:');
  mostrarMatriz(B);

  traspuestaMatrizA(A); { Ej6 - b}
  writeln('Matriz traspuesta A:');
  mostrarMatriz(B);
end.
