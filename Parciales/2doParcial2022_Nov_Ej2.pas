program Ej2;
const
  MAX = 100; { Valor entero mayor estricto que 0 }

type
  TEspecie = (manzano, peral, naranjo);
  
  TArbol = record
    identificador: Integer;
    especie: TEspecie;
    case plaga: Boolean of
      true : (fumigado: Boolean);
      false: ();
  end;
  
  TCultivo = record
    arboles: array [1..MAX] of TArbol;
    tope: 0..MAX;
  end;
  
  TIDArbol = record
    ids: array [1..MAX] of Integer;
    tope: 0..MAX;
  end;

  
procedure arbolAFumigar(cultivo: TCultivo; esp: TEspecie; var af: TIDArbol);
{ Obtiene en 'af' los identificadores de los arboles de dicha especie 'esp' que tienen una plaga y 
  no fueron fumigados. }
var
  i: integer;
begin
  af.tope := 0;  { Inicializa 'af.tope' en 0 }

  i := 1;
  while i <= cultivo.tope do
  begin
    with cultivo.arboles[i] do
    begin
      if (especie = esp) and plaga and not fumigado then
      begin
        af.tope := af.tope + 1;
        af.ids[af.tope] := identificador;
      end; 
    end;
    i := i + 1;
  end;
end;

procedure actualizarCultivo(curados     : TIDArbol;
                            var cultivo : TCultivo);
var
  i,j : integer;

begin

  for i := 1 to curados.tope do
  begin
    for j := 1 to cultivo.tope do
    begin
      with cultivo.arboles[j] do
      begin
        if (identificador = curados.ids[i]) then
        begin
          fumigado := true;
          plaga := false;
        end;
      end;
    end;
  end;

end;

procedure imprimirDatosCultivo(cultivo: TCultivo);
var
  i: Integer;
begin
  writeln('Datos del cultivo:');
  for i := 1 to cultivo.tope do
  begin
    with cultivo.arboles[i] do
    begin
      write('ID: ', identificador:2, ', Especie: ');
      case especie of
        manzano: write('Manzano');
        peral: write('Peral');
        naranjo: write('Naranjo');
      end;
      if plaga then
      begin
        write(', Plaga: Si, Fumigado: ');
        if fumigado then
          writeln('Si')
        else
          writeln('No');
      end
      else
        writeln(', Plaga: No');
    end;
  end;
end;

procedure imprimirIdentificadores(af: TIDArbol);
var
  i: Integer;
begin
  writeln('Identificadores de los arboles:');
  for i := 1 to af.tope do
  begin
    writeln('ID: ', af.ids[i]:2);
  end;
end;

var
  cultivo: TCultivo;
  idArboles: TIDArbol;
  i: Integer;

begin
  { Inicialización del cultivo }
  cultivo.tope := 3;  { Supongamos que tenemos 3 árboles en el cultivo de manzana }

  cultivo.arboles[1].identificador := 1;
  cultivo.arboles[1].especie := manzano;
  cultivo.arboles[1].plaga := true;
  cultivo.arboles[1].fumigado := false;

  cultivo.arboles[2].identificador := 2;
  cultivo.arboles[2].especie := manzano;
  cultivo.arboles[2].plaga := false;

  cultivo.arboles[3].identificador := 3;
  cultivo.arboles[3].especie := manzano;
  cultivo.arboles[3].plaga := true;
  cultivo.arboles[3].fumigado := false;

  { Inicialización de idArboles }
  idArboles.tope := cultivo.tope;
  for i := 1 to cultivo.tope do
  begin
    idArboles.ids[i] := cultivo.arboles[i].identificador;
  end;

  { Impresión de los datos del cultivo }
  imprimirDatosCultivo(cultivo);

  { Llamada a la función arbolAFumigar }
  arbolAFumigar(cultivo, manzano, idArboles);

  writeln;
  { Impresión de los identificadores a fumigar }
  writeln('Identificadores de los arboles -> A fumigar:');
  imprimirIdentificadores(idArboles);

  writeln;
  { Actualizamos el estado de los arboles fumigados }
  actualizarCultivo(idArboles, cultivo);

  writeln('------------------------------------------');
  { Impresión de los identificadores curados }
  writeln('Identificadores de los arboles -> Curados:');
  imprimirIdentificadores(idArboles);

  writeln;
  { Impresión de los datos del cultivo actualizados }
  imprimirDatosCultivo(cultivo);
end.
