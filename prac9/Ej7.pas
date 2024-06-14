program prac9Ej7;

const 
  M = 2; { Número de filas de A y C }
  N = 2; { Número de columnas de A y filas de B }
  P = 2; { Número de columnas de B y C }

type
  RangoM = 1..M;
  RangoN = 1..N;
  RangoP = 1..P;
  MatrizMN = array [RangoM, RangoN] of integer; { Matriz A }
  MatrizNP = array [RangoN, RangoP] of integer; { Matriz B }
  MatrizMP = array [RangoM, RangoP] of integer; { Matriz C, producto de A y B }

var
  A : MatrizMN;
  B : MatrizNP;
  C : MatrizMP;

{ Calcula la matriz producto }
procedure productoMatrices(a: MatrizMN; b: MatrizNP; var c: MatrizMP);
var
  i, j, k : integer;
begin
  for i := 1 to M do
    for j := 1 to P do
    begin
      c[i,j] := 0;  { Inicializar el elemento c[i,j] }
      for k := 1 to N do 
        c[i,j] := c[i,j] + a[i,k] * b[k,j];
    end;
end;

{ Imprime la matriz }
procedure mostrarMatriz(t: MatrizMP);
var
  i, j : integer;
begin
  for i := 1 to M do
  begin
    for j := 1 to P do
      write(t[i,j]:3);
    writeln;
  end;
end;

{ Programa Principal }
begin
  writeln('Producto de Matrices');
  
  { Inicializa la matriz A de manera manual }
  A[1,1] := 1; A[1,2] := 2; 
  A[2,1] := 3; A[2,2] := 4;
  
  { Inicializa la matriz B de manera manual }
  B[1,1] := 5; B[1,2] := 6; 
  B[2,1] := 7; B[2,2] := 8;
  
  productoMatrices(A, B, C);
  
  writeln('Matriz A:');
  mostrarMatriz(A);
  writeln('Matriz B:');
  mostrarMatriz(B);
  writeln('Matriz C (Producto A * B):');
  mostrarMatriz(C);
end.
