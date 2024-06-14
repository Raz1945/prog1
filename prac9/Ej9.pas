program CompactarMatrizSimetrica;

const
  N = 4; { valor mayor estricto a 0 }

type
  RangoN = 1..N;
  MatrizN = array [RangoN, RangoN] of integer;
  ArregloUni = array [1..(N*(N+1) div 2)] of integer; { Arreglo unidimensional }

var
  A: MatrizN;
  ArregloX: ArregloUni;

{ ArregloUnidimensional }
procedure CompactarTrianguloSuperior(a: MatrizN; var arrayU: ArregloUni);
var
  i, j, k: integer;
begin
  k := 0;
  for i := 1 to N do
    for j := i to N do
    begin
      k := k + 1;
      arrayU[k] := a[i, j];
    end;
end;

procedure MostrarArregloUni(arrayU: ArregloUni; tam: integer);
var
  i: integer;
begin
  for i := 1 to tam do
    write(arrayU[i]:3);
  writeln;
end;

{ Programa Principal }
begin
  writeln('Compactar Matriz Simétrica');
  
  { Inicializa la matriz A de manera manual }
  A[1,1] := 72; A[1,2] := 50; A[1,3] := 48; A[1,4] := 26;
  A[2,1] := 50; A[2,2] := 91; A[2,3] := 10; A[2,4] := 64;
  A[3,1] := 48; A[3,2] := 10; A[3,3] := 55; A[3,4] := 30;
  A[4,1] := 26; A[4,2] := 64; A[4,3] := 30; A[4,4] := 87;

  CompactarTrianguloSuperior(A, ArregloX);

  writeln('Arreglo Unidimensional resultante:');
  MostrarArregloUni(ArregloX, N*(N+1) div 2);
end.
