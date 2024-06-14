program prac10Ej12;

const
  CANT_LETRAS = 40;  { Valor entero mayor a 0 }
  CANT_ARTICULOS = 10; { Valor entero mayor a 0 }

type
  TIdioma = (es, en, pt);

  TFecha = record
    dia: 1..31;
    mes: 1..12;
    anio: 2001..9999;
  end;

  TNombre = array[1..CANT_LETRAS] of char;

  TArticulo = record
                  nombre: TNombre;
                  idioma: TIdioma;
                  visitas: integer;
                  ultimo_art: TFecha;
  end;

  Wikipedia = array[1..CANT_ARTICULOS] of TArticulo;

var
  art1, art2, art3, art4, art5, art6, art7, art8, art9, art10: TArticulo;
  wiki: Wikipedia;

function esPosterior(f1, f2: TFecha): boolean; { Devuelve TRUE si la f1 es posterior a f2, osea, que es mas reciente. }
begin
  if f1.anio > f2.anio then
    esPosterior := True
  else if f1.anio = f2.anio then
    if f1.mes > f2.mes then
      esPosterior := True
    else if f1.mes = f2.mes then
      esPosterior := f1.dia > f2.dia
    else
      esPosterior := False
  else
    esPosterior := False;
end;

{ Devuelve el articulo que tenga la fecha mas reciente en el idioma especificado }
procedure articuloMasReciente(wiki: Wikipedia; idioma: TIdioma; var art: TArticulo);
var
  i: integer;
  encontrado: boolean;
begin
  encontrado := False;
  for i := 1 to CANT_ARTICULOS do
  begin
    if (wiki[i].idioma = idioma) then
    begin
      if not encontrado or esPosterior(wiki[i].ultimo_art, art.ultimo_art) then
      begin
        art := wiki[i];
        encontrado := True;
      end;
    end;
  end;
  if encontrado then
    writeln('El articulo mas reciente es: ', art.nombre)
  else
    writeln('No se encontraron articulos en el idioma especificado.');
end;

{ Muestra la coleccion de articulos }
procedure mostrarArticulos(w: Wikipedia);
var
  i, j: integer;
  nombreVacio: boolean;
begin
  writeln('Listado de Articulos:');
  for i := 1 to CANT_ARTICULOS do
  begin
    nombreVacio := True;
    for j := 1 to CANT_LETRAS do
      if w[i].nombre[j] <> #0 then { #0 es para comparar con los elementos vacios }
        nombreVacio := False;

    if not nombreVacio then
    begin
      writeln('  Articulo :', i:2);
      writeln('  Nombre :', w[i].nombre:41);
      case w[i].idioma of
        es: Writeln('  Idioma : Es');
        en: Writeln('  Idioma : En');
        pt: Writeln('  Idioma : Pt');
      end;
      writeln('  Visitas :', w[i].visitas:4);
      writeln('  Fecha :', w[i].ultimo_art.dia:3, '/', w[i].ultimo_art.mes:2, '/', w[i].ultimo_art.anio:4);
      writeln;
    end;
  end;
end;

{ Programa Principal }
begin
  { Inicializa algunos artículos }
  art1.nombre := 'El Manual del Jugador';
  art1.idioma := es;
  art1.visitas := 10;
  art1.ultimo_art.dia := 10;
  art1.ultimo_art.mes := 5;
  art1.ultimo_art.anio := 2024;
  wiki[1] := art1;

  art2.nombre := 'Player is Handbook';
  art2.idioma := en;
  art2.visitas := 10;
  art2.ultimo_art.dia := 10;
  art2.ultimo_art.mes := 12;
  art2.ultimo_art.anio := 2010;
  wiki[2] := art2;

  art3.nombre := 'La Guia del Dungeon Master';
  art3.idioma := es;
  art3.visitas := 10;
  art3.ultimo_art.dia := 10;
  art3.ultimo_art.mes := 11;
  art3.ultimo_art.anio := 2023;
  wiki[3] := art3;

  art4.nombre := 'The Dungeon Master is Guide';
  art4.idioma := en;
  art4.visitas := 10;
  art4.ultimo_art.dia := 12;
  art4.ultimo_art.mes := 12;
  art4.ultimo_art.anio := 2023;
  wiki[4] := art4;

  art5.nombre := 'Guia do Mestre de Masmorras';
  art5.idioma := pt;
  art5.visitas := 10;
  art5.ultimo_art.dia := 20;
  art5.ultimo_art.mes := 1;
  art5.ultimo_art.anio := 2024;
  wiki[5] := art5;

  art6.nombre := 'El Bestiario de Monstruos';
  art6.idioma := es;
  art6.visitas := 200;
  art6.ultimo_art.dia := 18;
  art6.ultimo_art.mes := 1;
  art6.ultimo_art.anio := 2024;
  wiki[6] := art6;

  art7.nombre := 'La Maldicion de Strahd';
  art7.idioma := es;
  art7.visitas := 500;
  art7.ultimo_art.dia := 25;
  art7.ultimo_art.mes := 5;
  art7.ultimo_art.anio := 2024;
  wiki[7] := art7;

  art8.nombre := 'Curse of Strahd';
  art8.idioma := en;
  art8.visitas := 500;
  art8.ultimo_art.dia := 25;
  art8.ultimo_art.mes := 5;
  art8.ultimo_art.anio := 2024;
  wiki[8] := art8;

  // mostrarArticulos(wiki);  
  articuloMasReciente(wiki, es, art10);  

end.
