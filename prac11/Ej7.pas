program prac11Ej7;
const  
  MAXPIRATAS = 3; { Valor entero mayor estricto a 0 }
  MAXASALTOS = 10; { Valor entero mayor estricto a 0 }
  MAXDIGITOSCI = 4; { Valor entero mayor estricto a 0 }
  MAXCADENA = 40; { Valor entero mayor estricto a 0 }

{ Definiciones }
type
  TipoCadena = record
      letra : array [1..MAXCADENA] of char;
      tope: 0..MAXCADENA;
  end;

  TipoCI = array [1..MAXDIGITOSCI] of '0'..'9';

  TipoFecha = record
      dia: 1..31;
      mes: 1..12;
      anio: 0..MaxInt;
  end;

  TipoAsalto = record
      nombre_barco: TipoCadena;
      fecha: TipoFecha;
      botin: integer;
  end;

  ConjuntoAsaltos = record
      asalto: array [1..MAXASALTOS] of TipoAsalto;
      tope: 0..MAXASALTOS;
  end;

  TipoCausaMuerte = (asesinato, enfermedad, accidente);

  TipoPirata = record
      nombre: TipoCadena;
      ci: TipoCI;
      case estaVivo: boolean of
          true: (cantAsaltos: ConjuntoAsaltos);
          false: (
            causaMuerte: TipoCausaMuerte;
            fechaMuerte: TipoFecha;
          );
  end;

  Banda = record
      piratas: array [1..MAXPIRATAS] of TipoPirata;
      tope: 0..MAXPIRATAS;
  end;

  type
    ConjuntoCIs = record
      cedulas : array [1..MAXPIRATAS] of TipoCI;
      tope : 0..MAXPIRATAS;
  end;


function ciIguales(ci1, ci2 : TipoCI): boolean;
var 
  i : integer;
  iguales : boolean;
begin
  iguales := true;
  for i := 1 to MAXDIGITOSCI do
  begin
    if ci1[i] <> ci2[i] then
      iguales := false;
  end;
  ciIguales := iguales;
end;

function contarDinero(ca: ConjuntoAsaltos; anio: integer):integer;
var 
  i, botin : integer;
begin
  botin := 0;
  for i := 1 to ca.tope do
  begin
    if ca.asalto[i].fecha.anio = anio then
      botin := botin + ca.asalto[i].botin;
  end;
  contarDinero := botin;
end;

function dineroObtenidoPorPirata(pirata: TipoPirata; anio: integer; b: Banda):integer;
var
  i, totalBotin : integer;
begin
  totalBotin := 0;

  { Verifico que el pirata este vivo. }
  if (pirata.estaVivo = true) then
  begin
    { Verifico si la ci coincide con la de alguno de los integrantes de la banda }
    for i := 1 to b.tope do
    begin
      if ciIguales(pirata.ci, b.piratas[i].ci) then
        totalBotin := contarDinero(pirata.cantAsaltos, anio);
    end;
  end;

  dineroObtenidoPorPirata := totalBotin;
end;


procedure hallarGanadores(b: Banda; anio: integer; var piratasMerecedores: ConjuntoCIs);
var
  i: integer;
begin
  piratasMerecedores.tope := 0;
  
  { Busco los posibles participantes que se encuentren vivos y hayan realizado asaltos en el año dado. }
  for i := 1 to b.tope do
  begin
    if b.piratas[i].estaVivo and (contarDinero(b.piratas[i].cantAsaltos, anio) > 0) then
    begin
      piratasMerecedores.tope := piratasMerecedores.tope + 1;
      piratasMerecedores.cedulas[piratasMerecedores.tope] := b.piratas[i].ci;
    end;
  end;
end;



{ Datos del pirata }
procedure mostrarDatosPirata(p: TipoPirata; b: Banda);
var
  i, j: integer;
begin
  { Nombre del pirata }
  write('Nombre del pirata: ');
  for i := 1 to p.nombre.tope do
    write(p.nombre.letra[i]);
  writeln;

  { Nombres de los barcos }
  writeln('Barcos:');
  for i := 1 to p.cantAsaltos.tope do
  begin
    write('':5,i:2,': ');
    for j := 1 to p.cantAsaltos.asalto[i].nombre_barco.tope do
      write(p.cantAsaltos.asalto[i].nombre_barco.letra[j]);
    writeln;
  end;

  { Banda a la que pertenece }
  write('Banda perteneciente: ');
  for i := 1 to b.tope do
  begin
    for j := 1 to b.piratas[i].nombre.tope do
      write(b.piratas[i].nombre.letra[j]);
    writeln;
  end;
end;

{ Programa principal }
var
  BarbaNegra, Monky, Nami: TipoPirata;
  BandaBarbaNegra, OnePice: Banda;
  piratasMerecedores : ConjuntoCIs;
  i, j : integer;

begin
  { Inicializar el pirata Barba Negra}
    BarbaNegra.nombre.tope := 11;
    BarbaNegra.nombre.letra[01] := 'B';
    BarbaNegra.nombre.letra[02] := 'a';
    BarbaNegra.nombre.letra[03] := 'r';
    BarbaNegra.nombre.letra[04] := 'b';
    BarbaNegra.nombre.letra[05] := 'a';
    BarbaNegra.nombre.letra[06] := ' ';
    BarbaNegra.nombre.letra[07] := 'N';
    BarbaNegra.nombre.letra[08] := 'e';
    BarbaNegra.nombre.letra[09] := 'g';
    BarbaNegra.nombre.letra[10] := 'r';
    BarbaNegra.nombre.letra[11] := 'a';

    BarbaNegra.ci[1] := '0';
    BarbaNegra.ci[2] := '0';
    BarbaNegra.ci[3] := '7';
    BarbaNegra.ci[4] := '0';

    BarbaNegra.estaVivo := true;
    BarbaNegra.cantAsaltos.tope := 2;

    BarbaNegra.cantAsaltos.asalto[1].nombre_barco.tope := 4;
    BarbaNegra.cantAsaltos.asalto[1].nombre_barco.letra[1] := 'B';
    BarbaNegra.cantAsaltos.asalto[1].nombre_barco.letra[2] := 'l';
    BarbaNegra.cantAsaltos.asalto[1].nombre_barco.letra[3] := 'u';
    BarbaNegra.cantAsaltos.asalto[1].nombre_barco.letra[4] := 'e';
    BarbaNegra.cantAsaltos.asalto[1].fecha.dia := 10;
    BarbaNegra.cantAsaltos.asalto[1].fecha.mes := 12;
    BarbaNegra.cantAsaltos.asalto[1].fecha.anio := 1400;
    BarbaNegra.cantAsaltos.asalto[1].botin := 1000;

    BarbaNegra.cantAsaltos.asalto[2].nombre_barco.tope := 3;
    BarbaNegra.cantAsaltos.asalto[2].nombre_barco.letra[1] := 'R';
    BarbaNegra.cantAsaltos.asalto[2].nombre_barco.letra[2] := 'e';
    BarbaNegra.cantAsaltos.asalto[2].nombre_barco.letra[3] := 'd';
    BarbaNegra.cantAsaltos.asalto[2].fecha.dia := 1;
    BarbaNegra.cantAsaltos.asalto[2].fecha.mes := 1;
    BarbaNegra.cantAsaltos.asalto[2].fecha.anio := 1400;
    BarbaNegra.cantAsaltos.asalto[2].botin := 3000;

    { Inicializar la banda }
    BandaBarbaNegra.tope := 1;
    BandaBarbaNegra.piratas[1] := BarbaNegra;

    writeln;
    { Datos del pirata }
    mostrarDatosPirata(BarbaNegra, BandaBarbaNegra);

    { Calculo el botin obtenido por Barba Negra }
    writeln('Botin Barba Negra: ', dineroObtenidoPorPirata(
      BarbaNegra,
      1400,
      BandaBarbaNegra
      )
    );

  writeln;
  { Inicializar el pirata Monky }
    Monky.nombre.tope := 5;
    Monky.nombre.letra[01] := 'M';
    Monky.nombre.letra[02] := 'o';
    Monky.nombre.letra[03] := 'n';
    Monky.nombre.letra[04] := 'k';
    Monky.nombre.letra[05] := 'y';

    Monky.ci[1] := '0';
    Monky.ci[2] := '6';
    Monky.ci[3] := '6';
    Monky.ci[4] := '8';

    Monky.estaVivo := true;
    Monky.cantAsaltos.tope := 2;

    Monky.cantAsaltos.asalto[1].nombre_barco.tope := 4;
    Monky.cantAsaltos.asalto[1].nombre_barco.letra[1] := 'A';
    Monky.cantAsaltos.asalto[1].nombre_barco.letra[2] := 'k';
    Monky.cantAsaltos.asalto[1].nombre_barco.letra[3] := 'i';
    Monky.cantAsaltos.asalto[1].nombre_barco.letra[4] := 'o';
    Monky.cantAsaltos.asalto[1].fecha.dia := 10;
    Monky.cantAsaltos.asalto[1].fecha.mes := 12;
    Monky.cantAsaltos.asalto[1].fecha.anio := 1400;
    Monky.cantAsaltos.asalto[1].botin := 1000;

    Monky.cantAsaltos.asalto[2].nombre_barco.tope := 3;
    Monky.cantAsaltos.asalto[2].nombre_barco.letra[1] := 'P';
    Monky.cantAsaltos.asalto[2].nombre_barco.letra[2] := 'i';
    Monky.cantAsaltos.asalto[2].nombre_barco.letra[3] := 't';
    Monky.cantAsaltos.asalto[2].fecha.dia := 1;
    Monky.cantAsaltos.asalto[2].fecha.mes := 1;
    Monky.cantAsaltos.asalto[2].fecha.anio := 1400;
    Monky.cantAsaltos.asalto[2].botin := 5000;

    { Inicializar la banda }
    OnePice.tope := 1;
    OnePice.piratas[1] := Monky;

    { Datos del pirata }
    mostrarDatosPirata(Monky, OnePice);

    { Calculo el botin obtenido por Monky }
    writeln('Botin Monky: ', dineroObtenidoPorPirata(
      Monky,
      1400,
      OnePice
      )
    );
  writeln;
  { Inicializar la pirata Nami }
    Nami.nombre.tope := 5;
    Nami.nombre.letra[01] := 'M';
    Nami.nombre.letra[02] := 'o';
    Nami.nombre.letra[03] := 'n';
    Nami.nombre.letra[04] := 'k';
    Nami.nombre.letra[05] := 'y';

    Nami.ci[1] := '0';
    Nami.ci[2] := '7';
    Nami.ci[3] := '7';
    Nami.ci[4] := '7';

    Nami.estaVivo := true;
    Nami.cantAsaltos.tope := 2;

    Nami.cantAsaltos.asalto[1].nombre_barco.tope := 4;
    Nami.cantAsaltos.asalto[1].nombre_barco.letra[1] := 'N';
    Nami.cantAsaltos.asalto[1].nombre_barco.letra[2] := 'A';
    Nami.cantAsaltos.asalto[1].nombre_barco.letra[3] := 'M';
    Nami.cantAsaltos.asalto[1].nombre_barco.letra[4] := 'I';
    Nami.cantAsaltos.asalto[1].fecha.dia := 10;
    Nami.cantAsaltos.asalto[1].fecha.mes := 12;
    Nami.cantAsaltos.asalto[1].fecha.anio := 1400;
    Nami.cantAsaltos.asalto[1].botin := 1000;

    Nami.cantAsaltos.asalto[2].nombre_barco.tope := 3;
    Nami.cantAsaltos.asalto[2].nombre_barco.letra[1] := 'T';
    Nami.cantAsaltos.asalto[2].nombre_barco.letra[2] := 'A';
    Nami.cantAsaltos.asalto[2].nombre_barco.letra[3] := 'C';
    Nami.cantAsaltos.asalto[2].fecha.dia := 1;
    Nami.cantAsaltos.asalto[2].fecha.mes := 2;
    Nami.cantAsaltos.asalto[2].fecha.anio := 1400;
    Nami.cantAsaltos.asalto[2].botin := 10000;

    { Inicializar la banda }
    OnePice.tope := 2;
    OnePice.piratas[2] := Nami;

    { Datos del pirata }
    mostrarDatosPirata(Nami, OnePice);

    { Calculo el botin obtenido por Nami }
    writeln('Botin Nami: ', dineroObtenidoPorPirata(
      Nami,
      1400,
      OnePice
      )
    );
  writeln;

  { Inicializar la variable piratasMerecedores }
  piratasMerecedores.tope := 0;

  { Encontrar los ganadores }
  hallarGanadores(OnePice, 1400, piratasMerecedores);

  { Mostrar los posibles ganadores del premio Calavera de Oro. }
  writeln('Piratas merecedores del premio Calavera de Oro en el anio 1400:');
  for i := 1 to piratasMerecedores.tope do
  begin
    write('CI del pirata: ');
    for j := 1 to MAXDIGITOSCI do
      write(piratasMerecedores.cedulas[i][j]);
    writeln;
  end;

end.
