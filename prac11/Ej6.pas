program prac11Ej6;

const
  M = 2; { valores mayores estrictos a 1 }
  N = 2; { valores mayores estrictos a 1 }
  P = 2; { valores mayores estrictos a 1 }
  Q = 3; { valores mayores estrictos a 1 }

type
  TNat = 0..MaxInt;
  MError = (proderr, argerr); { error en el producto n != p, argumento invalido}
  MEstado = (correcto, incorrecto);

  RangoM = 1..M;
  RangoN = 1..N;
  RangoP = 1..P;
  RangoQ = 1..Q;

  MatrizMN = array[RangoM, RangoN] of TNat;
  MatrizPQ = array[RangoP, RangoQ] of TNat;
  MatrizProd = array[RangoM, RangoQ] of TNat;

  MNerr = record
    case estado: MEstado of
      correcto: (
        mat1: record
          data: MatrizMN;
          m: TNat;
          n: TNat;
        end;
        mat2: record
          data: MatrizPQ;
          p: TNat;
          q: TNat;
        end;
        matProd: record
          data: MatrizProd;
          m: TNat;
          q: TNat;
        end
      );
      incorrecto: (err: MError);
  end;

{ Procedimiento para multiplicar matrices }
procedure productoMatrices(m1, m2: MNerr; var resu: MNerr);
var
  i, j, k: TNat;
begin
  { Verifico los estados antes de iniciar }
  if (m1.estado = correcto) and (m2.estado = correcto) then
  begin
    if (m1.mat1.n <> m2.mat2.p) then
    begin
      resu.estado := incorrecto;
      resu.err := proderr;
    end
    else
    begin
      resu.estado := correcto; { si n = p}
      resu.matProd.m := m1.mat1.m;
      resu.matProd.q := m2.mat2.q;
      for i := 1 to m1.mat1.m do
        for j := 1 to m2.mat2.q do
        begin
          resu.matProd.data[i, j] := 0; { Inicializar el resultado con cero }
          for k := 1 to m1.mat1.n do
            resu.matProd.data[i, j] := resu.matProd.data[i, j] + m1.mat1.data[i, k] * m2.mat2.data[k, j];
        end;
    end;
  end
  else { Caso de error por argumento inválido }
  begin
    resu.estado := incorrecto;
    resu.err := argerr;
  end;
end;

procedure mostrarResultado(resu: MNerr);
var
  i, j: TNat;
begin
  if resu.estado = incorrecto then
  begin
    case resu.err of
      proderr: writeln('ERROR: Al intentar multiplicar las matrices, n != p');
      argerr: writeln('ERROR: Alguno de los argumentos no son válidos');
    end;
  end
  else
  begin
    writeln('Resultado:');
    for i := 1 to resu.matProd.m do
    begin
      for j := 1 to resu.matProd.q do
        write(resu.matProd.data[i, j]:4);
      writeln;
    end;
  end;
end;

var
  m1, m2, resu: MNerr;

begin
  { Inicializa el registro m1 y m2 con las matrices y sus dimensiones }
  m1.estado := correcto;
  m1.mat1.m := M;
  m1.mat1.n := N;
  m2.estado := correcto;
  m2.mat2.p := P;
  m2.mat2.q := Q;

  { Inicializa la matriz M1 }
  m1.mat1.data[1, 1] := 1; m1.mat1.data[1, 2] := 2; 
  m1.mat1.data[2, 1] := 3; m1.mat1.data[2, 2] := 4;

  { Inicializa la matriz M2 }
  m2.mat2.data[1, 1] := 5; m2.mat2.data[1, 2] := 6; m2.mat2.data[1, 3] := 7;
  m2.mat2.data[2, 1] := 8; m2.mat2.data[2, 2] := 9; m2.mat2.data[2, 3] := 10;

  { Realiza el producto de matrices }
  productoMatrices(m1, m2, resu);

  { Muestra el resultado }
  mostrarResultado(resu);
end.
