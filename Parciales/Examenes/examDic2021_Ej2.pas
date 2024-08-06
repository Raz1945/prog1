program examDic2021Ej2;

const 
  Max = 6;

type
  TPar = record 
          primero : real;
          segundo : real;
        end;

  TArreglo = array [1..Max] of TPar;

  TMultiplicidad = (ninguno, uno, dos, muchos);
  TResultado = record 
                case mult : TMultiplicidad of
                  ninguno : ();
                  uno     : (v      : real);
                  dos     : (v1, v2 : real);
                  muchos  : ();
              end;

procedure BuscarValor(w: real; arreglo : TArreglo; var result : TResultado);
var
  i, multi, pos : integer;
  valor : array [1..Max] of real;

begin
  multi := 0;
  pos   := 0;

  for i := 1 to Max do
  begin
    if (w = arreglo[i].primero) then
    begin
      multi      := multi + 1;
      pos        := pos + 1;
      valor[pos] := arreglo[i].segundo;
    end;
  end;
  
  case multi of
    0 : result.mult := ninguno;
    1 : 
      begin
        result.mult := uno;
        result.v  := valor[1];
      end;
    2 : 
      begin
        result.mult := dos;
        result.v1  := valor[1];
        result.v2  := valor[2];
      end;
    else  
      result.mult := muchos;
  end;
end;

{ Programa Principal }
var
  ta : TArreglo;
  result: TResultado;
begin
  { Inicialización del arreglo ta }
  ta[1].primero := 3.10; ta[1].segundo := 4.50;
  ta[2].primero := 4.50; ta[2].segundo := 6.20;
  ta[3].primero := 3.10; ta[3].segundo := 8.40;
  ta[4].primero := 4.50; ta[4].segundo := 2.30;
  ta[5].primero := 54.60; ta[5].segundo := 7.89;
  ta[6].primero := 3.10; ta[6].segundo := 4.60;

  BuscarValor(4.50, ta, result);

  { Mostrar el resultado }
  case result.mult of
    ninguno: writeln('Ninguno encontrado');
    uno: writeln('Uno encontrado: ', result.v:0:2);
    dos: writeln('Dos encontrados: ', result.v1:0:2, ' y ', result.v2:0:2);
    muchos: writeln('Muchos encontrados');
  end;
end.
