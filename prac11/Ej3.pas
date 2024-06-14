program prac11Ej3;
const 
  MAX = 45; { valor mayor estricto a 0}

type
  Cadena = record
                letras: array [1..MAX] of char;
                largo: 0..MAX;
  end;

procedure cargarCadena(var cad: Cadena);
var
  i : integer;
  caracterActual : char; 
begin
  i := 1;
  cad.largo := MAX;
  repeat
    read(caracterActual);

    if (caracterActual <> '.') then
    begin
      cad.letras[i] := caracterActual;
      i := i + 1;
    end;

  until (caracterActual = '.');
  cad.largo := i;
end;


procedure desplegarCadena(cad: Cadena);
var
  i : integer;
begin
  for i := 1 to cad.largo do
    write(cad.letras[i]);

  writeln;
end;


function contarOcurrencias(frase: Cadena; var car: char):integer;
var
  i, ocurrencias : integer;
begin
  ocurrencias := 0;

  for i := 1 to MAX do
  begin
    if (frase.letras[i] = car) then
      ocurrencias := ocurrencias + 1;
  end;

  contarOcurrencias := ocurrencias
end;

function existeVocal(cad: Cadena): boolean;
var
  i : integer;
  existe : boolean;
  vocales : set of char; { Conjunto }
begin
  existe := false;
  vocales := ['a', 'e', 'i', 'o', 'u'];

  for i := 1 to cad.largo do
  begin
    if cad.letras[i] in vocales then
      existe := true;
  end;

  existeVocal := existe;
end;


// Programa principal
var
  c : Cadena;
  letra : char;
begin
  writeln('Ingrese una cadena de caracteres finalizada con un punto:');
  cargarCadena(c);

  write('Frase: ');
  desplegarCadena(c);
  
  if existeVocal(c) then
    writeln('La frase tiene vocales.');

  letra := 'a';
  writeln('Cantidad de letras ',letra ,' en la frase es:', contarOcurrencias(c,letra):2);

end.
