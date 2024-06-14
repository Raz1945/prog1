program prac11Ej2;
const 
  MAXPERSONAS = 3; { valor entero mayor estricto a 0 }
  MAXCAD = 45; { valor entero mayor estricto a 0 }
type 
  Cadena = record
                letras : array [1..MAXCAD] of char;
                largo : 0..MAXCAD;
  end;

  Fecha = record
                dia : 1..31;
                mes : 1..12;
                anio : 0..maxint;
  end;

  Persona = record
                nombre : Cadena;
                fechNac : Fecha;
                indMadre, indPadre : 0..MAXPERSONAS;
  end;

  Familia = record
                  pers : array [1..MAXPERSONAS] of Persona;
                  tope : 0..MAXPERSONAS;
  end;


//  Compara las cadenas de caracteres 
function cadenasIguales(cad1, cad2 : Cadena):boolean;
var
  i : integer;
begin
  if cad1.largo <> cad2.largo then { Comparo las longitudes }
    cadenasIguales := false
  else { Si son del mismo largo, se comparan los caracteres de estas.}
    begin
      i := 1;
      while (i <= cad1.largo) and ( cad1.letras[i] = cad2.letras[i]) do
        i := i + 1;
        
      cadenasIguales := (i > cad1.largo);
    end;
end;


//  Despliega el nombre
procedure desplegarCadena(cad: Cadena);
var
  i : integer; 
begin
  for i := 1 to cad.largo do
    write(cad.letras[i]);

  writeln;
end;

// Despliega los detalles de una persona
procedure desplegarPersona(p: Persona);
begin
  writeln('Nombre: ');
  desplegarCadena(p.nombre);
  writeln('Fecha de nacimiento: ', p.fechNac.dia:2, '/', p.fechNac.mes:2, '/', p.fechNac.anio:4);
  if (p.indMadre <> 0) and (p.indPadre = 0) then
    writeln('Madre')
  else if (p.indMadre = 0) and (p.indPadre <> 0) then
    writeln('Padre')
  else if (p.indMadre = 0) and (p.indPadre = 0) then
    writeln('Hijo')
  else
    writeln('ERROR: Sin datos');

  writeln;
end;


// Asigna el nombre al 'objeto' persona
procedure asignarNombre(var cad: Cadena);
var
  i : integer;
  caracterActual : char;
begin
  i := 1;
  cad.largo := MAXCAD;

  writeln('Ingrese el nombre: ');
  repeat
    read(caracterActual);

    if (caracterActual <> '.') then
    begin
      cad.letras[i] := caracterActual; { Asigna los caracteres a su posicion }
      i := i + 1; { Cuenta la cantidad de caracteres que contiene la entrada }
    end;

  until caracterActual = '.';
  cad.largo := i; { Asigna el largo }
end;


// Asigna la fecha de nacimiento al 'objeto' persona
procedure asignarFecha(var f: Fecha);
var
  dia, mes, anio: integer;
begin
  writeln('Ingrese la fecha de nacimiento: ');
  write('Dia: ');
  readln(dia);
  write('Mes: ');
  readln(mes);
  write('Anio: ');
  readln(anio);

  if ((dia >= 1) and (dia <= 31)) and ((mes >= 1) and (mes <= 12)) and ( anio >= 1) then
  begin
    f.dia := dia;
    f.mes := mes;
    f.anio := anio;
  end
  else
    writeln('Fecha invalida');
end;

// Busca si el nombre ingresado pertenece a la familia ingresada
procedure antepasados(usted: Cadena; historia: Familia);
var
  i: integer;
  encontrado: boolean;
begin
  encontrado := false;
  for i := 1 to historia.tope do
  begin
    if cadenasIguales(usted, historia.pers[i].nombre) then
    begin
      writeln('Son parientes');
      encontrado := true;
    end;
  end;
  if not encontrado then
    writeln('No son parientes');
end;


{ Declaracion de variables }
var 
  pers1, pers2 : Persona;
  familia1 : Familia;
  usted : Cadena;

begin
  { Asignacion de la Familia 1}
  familia1.tope := 2; 

  { Inicialización del registro Persona 1}
  asignarNombre(pers1.nombre);
  // asignarFecha(pers1.fechNac);
  pers1.indPadre := 1;
  familia1.pers[1] := pers1; 
  writeln;

  { Inicialización del registro Persona 2}
  asignarNombre(pers2.nombre);
  // asignarFecha(pers2.fechNac);
  pers2.indMadre := 0;
  pers2.indPadre := 0;
  familia1.pers[2] := pers2; 
  writeln;

  { Inicialización de usted }
  writeln('Ingrese su nombre para verificar si pertenece a la familia:');
  asignarNombre(usted);
  antepasados(usted, familia1);

end.
