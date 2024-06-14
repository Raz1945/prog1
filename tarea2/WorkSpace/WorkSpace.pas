program pruebaTarea2;

const
  MAXCOL = 80;       { cota de columnas de un archivo }
  MAXCAD = 60;       { cota de cadena de caracteres }

  { códigos de escape ANSI, usados internamente para el formato de impresión }
  ESC       = #27;
  Bold      = ESC + '[1m';
  Italics   = ESC + '[3m';
  Underline = ESC + '[4m';
  Res       = ESC + '[0m';

{ --------------------------------------------------- }
{ Typos de datos }

type
  { formato del texto }
  TipoFormato = (Neg, Ita, Sub);
  Formato     = array [TipoFormato] of boolean;

  { un carácter en un texto incluye su formato }
  Caracter    = record
                  car: char;
                  fmt: Formato
                end;

  { arreglo con tope que representa a una línea  }
  RangoColumna = 1..MAXCOL;
  Linea        = record
                    cars: array [RangoColumna] of Caracter;
                    tope: 0..MAXCOL
                end;

  PosibleLinea = record case esLinea :  boolean of
                          true  : (l: Linea);
                          false : ()
                end;


    { lista de líneas, que representa a un texto }
    Texto	= ^NodoLinea; 
    NodoLinea = record  
                    info : Linea;
                    sig  : Texto
                end;


    { posición en el texto }
    Posicion	= record
          linea    : 1 .. maxint;
          columna  : RangoColumna
      end;

    PosiblePosicion = record case esPosicion:  boolean of
          true  : (p: Posicion);
          false : ()
          end;

    PosibleColumna = record case esColumna:  boolean of
          true  : (col: 1 .. MAXCOL);
          false : ()
        end;

    { cadena de carácterers }
    Cadena	= record
          cars : array [1..MAXCAD] of char;
          tope : 0 .. MAXCAD
      end;




{ --------------------------------------------------- }
{ Funciones y prcesos creados }

function todosTienenFormatoEnLinea(tfmt: TipoFormato; ini, fin: RangoColumna; ln: Linea): boolean;
{ Retorna true solo si todos los caracteres de `ln` entre las columnas `ini` y `fin`, incluídos los extremos, tienen el formato `tfmt`.
  En otro caso retorna false. }
{ Precondiciones: 1 <= ini <= ln.tope; 1 <= fin <= ln.tope }
var
  i: integer;
  tieneFormato: boolean;
begin
  tieneFormato := true;
  i := ini;

  while (i <= fin) and tieneFormato do
  begin
    { Verifica que el caracter tenga algun formato establecido }
    if not ln.cars[i].fmt[tfmt] then
      tieneFormato := false;  
      //? Se podria agregar un 'else' para los casos donde se ingresan valores de TipoFormato incorrectos 

    i := i + 1; 
  end;

  todosTienenFormatoEnLinea := tieneFormato;
end;


procedure aplicarFormatoEnLinea ( tfmt: TipoFormato; ini, fin: RangoColumna; var ln: Linea );
{ Aplica el formato `tfmt` a los caracteres de `ln` entre las columnas `ini` y `fin`, incluídos los extremos. 
  Si todos los carácteres ya tienen el tipo de formato `tfmt`, en lugar de aplicarlo lo quita. }
{ Precondiciones: 1 <= ini <= ln.tope;1 <= fin <= ln.tope }
var
  i: integer;
begin
  for i := ini to fin do    
  begin
    // ln.cars[i].fmt[tfmt] := not ln.cars[i].fmt[tfmt]; { Se puede definir asi}

    case tfmt of { O se puede definir de esta manera para mayor control de los casos }
      Neg: ln.cars[i].fmt[Neg] := not ln.cars[i].fmt[Neg];
      Ita: ln.cars[i].fmt[Ita] := not ln.cars[i].fmt[Ita];
      Sub: ln.cars[i].fmt[Sub] := not ln.cars[i].fmt[Sub];
    end;
    //? Se podria agregar un 'else' para los casos donde se ingresan valores de TipoFormato incorrectos 

  end;
end;


function contarCaracteresEnTexto ( txt: Texto ) : integer;
{ Retorna la cantidad de caracteres que tiene el texto `txt` }
//? Al momento de contar la cantidad de caracteres, los espacio y saltos de linea cuentan? 
var 
  t: Texto;
  total: integer;
begin
  t := txt;
  total := 0;

  while (t <> nil) do
  begin
    total := total + t^.info.tope;
    t := t^.sig;
  end;

  contarCaracteresEnTexto := total;
end;


procedure buscarCadenaEnLineaDesde ( c: Cadena; ln: Linea; desde: RangoColumna; var pc: PosibleColumna );
{ Busca la primera ocurrencia de la cadena `c` en la línea `ln` a partir de la columna `desde`.
  Si la encuentra, retorna en `pc` (pc -> boolean) la columna en la que incia. } 

{ Precondiciones: 1 <= desde <= ln.tope }
var
  i, j: integer; 
  seEncontro: boolean;
begin
  { Verifico si el arreglo Cadena mayor a cero ,y que sea menor o igual que el arreglo 'Linea'. 
    Sino lo es no debe de entrar en la busqueda. }
  if (c.tope > 0) and (c.tope <= ln.tope) then
  begin
    i := desde; { Se inicializa desde la posicion desde }
    pc.esColumna := false; { Se inicializa para asegurar el correcto funcionamiento del proceso. }

    { i = 3, ln.tope = 10, c.tope = 4 => 3 <= ( 10 - 4 + 1 ) = 7, 
      ==> 7 es la cantidad maxima de caracteres que se pueden recorrer. }
    while (i <= ln.tope - c.tope + 1) do
    begin
      j := 1;
      seEncontro := true;

      while (j <= c.tope) and seEncontro do
      begin
        { Compara si la posicion 'result' de ln es <> a la posicion 'j' de c } 
        { i = 3, j = 1 --> 'result' = 3 + 1 - 1 = 3  => False, sale del while. }
        { i = 4, j = 1 --> 'result' = 4 + 1 - 1 = 4  => True, continua...}
        { i = 4, j = 2 --> 'result' = 4 + 2 - 1 = 5  => True, continua...}
        { i = 4, j = 3 --> 'result' = 4 + 3 - 1 = 6  => True, continua...}
        { i = 4, j = 4 --> 'result' = 4 + 4 - 1 = 7  => True, sale del while (4 <= 4)}
        if ln.cars[i + j - 1].car <> c.cars[j] then
          seEncontro := false
        else
          j := j + 1;
      end;

      { Guarda la posicion de i, que es donde inicia la coincidencia de la busqueda. }
      if seEncontro then
      begin
        pc.esColumna := true;
        pc.col := i;
      end;

      i := i + 1;
    end;
  end;
end;


procedure buscarCadenaEnTextoDesde ( c: Cadena; txt :Texto; desde: Posicion; var pp: PosiblePosicion );
{ Busca la primera ocurrencia de la cadena `c` en el texto `txt` a partir de la posición `desde`. 
  Si la encuentra, retorna en `pp` la posición en la que inicia. 
  **La búsqueda no encuentra cadenas que ocupen más de una línea.** }

{ Precondiciones: 1 <= desde.linea <= cantidad de líneas 
                  1 <= desde.columna <= tope de línea en desde.linea } 
var
  i, j, totalCaracteresTxt : integer;
  seEncontro: boolean;

begin
  { Verifico si el arreglo Cadena es mayor a cero, tambien debera de ser menor o igual que a la cantidad total de caracteres que posea el texto }
  totalCaracteresTxt := contarCaracteresEnTexto(txt);

  if (c.tope > 0) and (c.tope <= totalCaracteresTxt) then
  begin
    i := desde; { Se inicializa desde la posicion desde }
    pp.esPosicion := false; { Se inicializa para asegurar el correcto funcionamiento del proceso. }

    // **La búsqueda no encuentra cadenas que ocupen más de una línea.** 
    //? Las cantidad maxima de caracretes en una linea seria 80 o 60? --> suponiendo que sea  MAXCOL = 80;
    { Cual es la cantidad de caracteres a recorrer siendo que no pueden ocupar mas de una linea. }
    while (i <= MAXCOL) and (i <= txt^.info.tope - c.tope + 1 ) do
    begin
      j := 1; { Corresponde a la posicion de la Cadena 'c' }
      seEncontro := true;

      while (j <= c.tope) and seEncontro do
      begin
        { Compara segun la posicion }
        { i = 3, j = 1 --> 'result' = 3 + 1 - 1 = 3  => False, sale del while. }

        if (txt.^info.cars[i + j - 1] <> c.cars[j]) then
          seEncontro := false
        else
          j := j + 1; 

      end;
    end;
  end;


end;


{ --------------------------------------------------- }
{ Procesos y funciones brindadas para el testeo. }

procedure mostrarCaracter(c: Caracter);
{ Muestra el caracter c formateado }
begin
  if c.fmt[Neg] then write(Bold);
  if c.fmt[Ita] then write(Italics);
  if c.fmt[Sub] then write(Underline);
  write(c.car);
  write(Res)
end;

procedure mostrarLinea(ln: Linea);
{ Muestra la línea ln formateada }
var
  i: integer;
begin
  for i := 1 to ln.tope do
    mostrarCaracter(ln.cars[i]);
  writeln
end;

procedure mostrarLineaCol(ln: Linea; n: integer);
{ Muestra la línea ln formateada e indica un número de columna }
var
  k: integer;
begin
  mostrarLinea(ln);
  for k := 1 to n - 1 do
    write(' ');
  writeln('^')
end;

var
  ln1, ln2, ln3: Linea; { Arreglo }
  parrafo1, parrafo2, parrafo3 : Texto; { Puntero }
  cad : Cadena;
  pc : PosibleColumna;
begin
{ Texto linea 1}
  ln1.tope := 8;
  ln1.cars[01].car := 'F';
  ln1.cars[02].car := 'O';
  ln1.cars[03].car := 'r';
  ln1.cars[04].car := 'm';
  ln1.cars[05].car := 'a';
  ln1.cars[06].car := 't';
  ln1.cars[07].car := 'o';
  ln1.cars[08].car := ':';
// salto de linea
{ Texto linea 2}
  ln2.tope := 12;
  ln2.cars[01].car := '-';
  ln2.cars[02].car := 'E';
  ln2.cars[03].car := 'n';
  ln2.cars[04].car := ' ';
  ln2.cars[05].car := 'n';
  ln2.cars[06].car := 'e';
  ln2.cars[07].car := 'g';
  ln2.cars[08].car := 'r';
  ln2.cars[09].car := 'i';
  ln2.cars[10].car := 't';
  ln2.cars[11].car := 'a';
  ln2.cars[12].car := ',';
// salto de linea
{ Texto linea 3}
  ln3.tope := 12;
  ln3.cars[01].car := '-';
  ln3.cars[02].car := 'E';
  ln3.cars[03].car := 'n';
  ln3.cars[04].car := ' ';
  ln3.cars[05].car := 'c';
  ln3.cars[06].car := 'u';
  ln3.cars[07].car := 'r';
  ln3.cars[08].car := 's';
  ln3.cars[09].car := 'i';
  ln3.cars[10].car := 'v';
  ln3.cars[11].car := 'a';
  ln3.cars[12].car := ',';
// salto de linea

{ Formato de texto }
  // aplicarFormatoEnLinea(Neg,5,11,ln2); { Aplica formato Negrita, ya que este no esta establecido. -> True }
  // // aplicarFormatoEnLinea(Neg,5,11,ln2); { Quita el formato negrita establecido -> False }

  // if todosTienenFormatoEnLinea(Neg,5,11,ln2) then
  // begin
  //   writeln('El texto tiene un formato aplicado. ');
  //   mostrarLineaCol(ln2, ln2.tope);
  // end
  // else
  //   writeln('No tiene formato.');
  // writeln;


{ Creo un puntero }
  new(parrafo1);
  parrafo1^.info := ln1;

  new(parrafo2);
  parrafo2^.info := ln2;
  parrafo1^.sig := parrafo2;

  new(parrafo3);
  parrafo3^.info := ln3;
  parrafo2^.sig := parrafo3;
  parrafo3^.sig := nil; { Por ser el ultimo nodo apunta al 'nil' }


  writeln('Cuantos caracteres contiene el texto?');
  writeln('Numero de caracteres en todo el texto: ', contarCaracteresEnTexto(parrafo1):2);
  writeln;


  { Cadena de textro }
  cad.tope := 4;
  cad.cars[01] := 'm';
  cad.cars[02] := 'a';
  cad.cars[03] := 't';
  cad.cars[04] := 'o';

  buscarCadenaEnLineaDesde(cad, ln1, 3, pc);

  if pc.esColumna then
    writeln('Se encontro la cadena en la posicion:', pc.col:2)
  else
    writeln('No se encontro la cadena en la linea.');
end.
