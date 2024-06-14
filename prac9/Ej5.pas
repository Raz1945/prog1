program prac9Ej5;

const 
  M = 3; { Valor mayor estricto a 1 }
  N = 5; { Valor mayor estricto a M } 
  { Entonces M < N }
type 
  CadenaM = array [1..M] of char;
  CadenaN = array [1..N] of char;

var
  cadM: CadenaM;
  cadN: CadenaN;
  indice: integer;

{ Carga una cadena de largo M desde la entrada estandar }
procedure leerCadenaM(var cadM : CadenaM);
var
  i : integer;
begin
  for i := 1 to M do
    readln(cadM[i]);
end;

{ Carga una cadena de largo N desde la entrada estandar }
procedure leerCadenaN(var cadN : CadenaN);
var
  i : integer;
begin
  for i := 1 to N do
    readln(cadN[i]);
end;

{ Calcula el indice en el que se encuentra la 1ra coincidencia entre dos cadenas }
function indiceSubCadena(cadm: CadenaM; cadn: CadenaN): integer;
  var
    i, j: integer;
    found: boolean;
  begin
    indiceSubCadena := 0; { Valor por defecto si no se encuentra la subcadena }

    for i := 1 to N - M + 1 do
    begin
      found := true; { se reinicia a true luego de cada iteracion }
      for j := 1 to M do
      begin
        if cadn[i + j - 1] <> cadm[j] then
        begin
          found := false;
          break;
        end;
      end;

      if found then
      begin
        indiceSubCadena := i;
        exit;
      end;
    end;
  end;

begin
  { Inicializa las cadenas de manera manual }
  // cadM[1] := 'a';
  // cadM[2] := 'b';
  // cadM[3] := 'c';
  
  // cadN[1] := 'x';
  // cadN[2] := 'd';
  // cadN[3] := 'a';
  // cadN[4] := 'b';
  // cadN[5] := 'c';

  { Inicializa las cadenas con valores cargados desde la entrada estandar }
  writeln('Ingrese los valores de la cadena de largo M:',M:2);
  leerCadenaM(cadM);

  writeln('Ingrese los valores de la cadena de largo N:',N:2);
  leerCadenaN(cadN);

  indice := indiceSubCadena(cadM, cadN);

  if indice > 0 then
    writeln('La primera coincidencia ocurre en el indice: ', indice:2)
  else
    writeln('No se encontró coincidencia.');
end.
