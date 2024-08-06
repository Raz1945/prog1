program Ej1;

const
  MaxDigito = 4;
  MaxUsuarios = 4;  // Ajustado para la prueba en el programa principal

{ Tipos de Datos }
type
  Documento = array[1..MaxDigito] of 0..9;
  
  Estado = (Agendado, Atendido, Ausente);
  
  Fecha = record
    dia: 1..31;
    mes: 1..12;
    anio: 1930..2030;
  end;

  Usuario = record
    documento: Documento;
    case est: Estado of
      Atendido: (FechaAtendido: Fecha);
      Agendado: (FechaAsignada: Fecha);
      Ausente: ();
  end;

  Agenda = record
    usuarios: array[1..MaxUsuarios] of Usuario;
    tope: 0..MaxUsuarios;
  end;

{ Funciones } 
function docIguales(doc1, doc2: Documento): boolean;
var
  i: integer;
  sonIguales: boolean;
begin
  i := 1;
  sonIguales := true;
  while (i <= MaxDigito) and sonIguales do
  begin
    if doc1[i] <> doc2[i] then
      sonIguales := false;
    i := i + 1;
  end;
  docIguales := sonIguales;
end;

function fechasIguales(fec1, fec2: Fecha): boolean;
begin
  fechasIguales := (fec1.dia = fec2.dia) and (fec1.mes = fec2.mes) and (fec1.anio = fec2.anio);
end;

function estadoUsuario(doc: Documento; age: Agenda): Estado;
var
  i: integer;
begin
  i := 1;
  while (i <= age.tope) and not (docIguales(doc, age.usuarios[i].documento)) do
    i := i + 1;
  
  if (i <= age.tope) then
    estadoUsuario := age.usuarios[i].est
  else
    estadoUsuario := Ausente;
end;

procedure usuariosFecha(fec : Fecha; age : Agenda; var atendidos : Agenda);
var
  i : integer;
begin
  atendidos.tope := 0;

  for i := 1 to age.tope do
  begin
    if (age.usuarios[i].est = Atendido) and (fechasIguales(fec, age.usuarios[i].FechaAtendido)) then
    begin
      atendidos.tope := atendidos.tope + 1;
      atendidos.usuarios[atendidos.tope] := age.usuarios[i];
    end;
  end;
end;

{ Otras funciones y procesos }
procedure ImprimirDoc(d: Documento);
var
  i: integer;
begin
  Write(' ': 6);
  for i := 1 to MaxDigito do
  begin
    Write(d[i]: 2, ' ': 1);
  end;
  writeln;
end;

procedure ImprimirFecha(f: Fecha);
begin
  writeln(f.dia: 2, '/', f.mes: 2, '/', f.anio: 4);
end;

var
  doc1, doc2, doc3, doc4: Documento;
  fech1, fech2: Fecha;
  age, atendidos: Agenda;
  est: Estado;
  i: integer;
begin
{ Inicializo los documentos }
  doc1[1] := 1; doc1[2] := 2; doc1[3] := 3; doc1[4] := 4;
  doc2[1] := 1; doc2[2] := 3; doc2[3] := 3; doc2[4] := 4;
  doc3[1] := 1; doc3[2] := 3; doc3[3] := 3; doc3[4] := 5;
  doc4[1] := 1; doc4[2] := 3; doc4[3] := 4; doc4[4] := 4;

{ Inicializo la Agenda }
  age.tope := 4;
  age.usuarios[1].documento := doc1;
  age.usuarios[1].est := Atendido;
  age.usuarios[1].FechaAtendido.dia := 15;
  age.usuarios[1].FechaAtendido.mes := 7;
  age.usuarios[1].FechaAtendido.anio := 2020;

  age.usuarios[2].documento := doc2;
  age.usuarios[2].est := Agendado;
  age.usuarios[2].FechaAsignada.dia := 20;
  age.usuarios[2].FechaAsignada.mes := 8;
  age.usuarios[2].FechaAsignada.anio := 2020;

  age.usuarios[3].documento := doc3;
  age.usuarios[3].est := Atendido;
  age.usuarios[3].FechaAtendido.dia := 15;
  age.usuarios[3].FechaAtendido.mes := 7;
  age.usuarios[3].FechaAtendido.anio := 2020;

  age.usuarios[4].documento := doc4;
  age.usuarios[4].est := Atendido;
  age.usuarios[4].FechaAtendido.dia := 15;
  age.usuarios[4].FechaAtendido.mes := 7;
  age.usuarios[4].FechaAtendido.anio := 2020;

{ Imprimo los resultados }
  writeln('Doc 1:');
  ImprimirDoc(doc1);
  writeln('Doc 2:');
  ImprimirDoc(doc2);

  if docIguales(doc1, doc2) then
    writeln('Son iguales')
  else
    writeln('Son distintos');

{ Inicializo la Fecha 1 }
  fech1.dia := 15;
  fech1.mes := 7;
  fech1.anio := 2020;

{ Inicializo la Fecha 2 }
  fech2.dia := 15;
  fech2.mes := 8;
  fech2.anio := 2020;

  writeln('Fecha 1:');
  ImprimirFecha(fech1);
  writeln('Fecha 2:');
  ImprimirFecha(fech2);

  if fechasIguales(fech1, fech2) then
    writeln('Las fechas son iguales')
  else
    writeln('Las fechas son distintas');

{ Prueba de estadoUsuario }
  est := estadoUsuario(doc1, age);
  writeln('Estado del usuario con Doc1: ', Ord(est));
  est := estadoUsuario(doc2, age);
  writeln('Estado del usuario con Doc2: ', Ord(est));

{ Documento no existente }
  doc1[1] := 9; // Modificar doc1 para que no coincida con ningún documento en la agenda
  est := estadoUsuario(doc1, age);
  writeln('Estado del usuario con documento no existente: ', Ord(est));

{ Prueba de usuariosFecha }
  writeln('Usuarios atendidos en la Fecha 1:');
  usuariosFecha(fech1, age, atendidos);
  for i := 1 to atendidos.tope do
  begin
    ImprimirDoc(atendidos.usuarios[i].documento);
  end;
end.
