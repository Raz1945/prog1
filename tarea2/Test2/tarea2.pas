
// Opcion 1
function todosTienenFormatoEnLinea(tfmt: TipoFormato; ini, fin: RangoColumna; ln: Linea): boolean;
  { Retorna true solo si todos los caracteres de `ln` entre las columnas `ini` y `fin`, incluídos los extremos, tienen el formato `tfmt`.
    En otro caso retorna false 
    Precondiciones: 1 <= ini <= ln.tope;
                    1 <= fin <= ln.tope }
var
  tieneFormato  : boolean;
  i             : integer;
Begin
  i := ini;
  tieneFormato := true;

  while (i <= fin) and tieneFormato do
  begin
    { Verifica que el caracter tenga algun formato establecido }
    if not ln.cars[i].fmt[tfmt] then
      tieneFormato := false;  
    //? Se podria agregar un 'else' para los casos donde se ingresan valores de TipoFormato incorrectos 

    i := i + 1; 
  end;

  todosTienenFormatoEnLinea := tieneFormato;
End;


// Opcion 2
procedure aplicarFormatoEnLinea ( tfmt: TipoFormato; ini, fin: RangoColumna; var ln: Linea );
  { Aplica el formato `tfmt` a los caracteres de `ln` entre las columnas `ini` y `fin`, incluídos los extremos. 
    Si todos los carácteres ya tienen el tipo de formato `tfmt`, en lugar de aplicarlo lo quita. 
    Precondiciones: 1 <= ini <= ln.tope;
                    1 <= fin <= ln.tope }
var
  i   : integer;
Begin
  for i := ini to fin do    
  begin
    case tfmt of 
      Neg: ln.cars[i].fmt[Neg] := not ln.cars[i].fmt[Neg];
      Ita: ln.cars[i].fmt[Ita] := not ln.cars[i].fmt[Ita];
      Sub: ln.cars[i].fmt[Sub] := not ln.cars[i].fmt[Sub];
    end;
    //? Se podria agregar un 'else' para los casos donde se ingresan valores de TipoFormato incorrectos 
  end;
End;


// Opcion 3
function contarCaracteresEnTexto ( txt: Texto ) : integer;
  { Retorna la cantidad de caracteres que tiene el texto `txt` }
var 
  totalCaracteres: integer;
Begin
  totalCaracteres := 0;

  while (txt <> nil) do
  begin
    totalCaracteres := totalCaracteres + txt^.info.tope;
    txt := txt^.sig;
  end;

  contarCaracteresEnTexto := totalCaracteres;
End;


// Opcion 4
procedure buscarCadenaEnLineaDesde (c: Cadena; ln: Linea; desde: RangoColumna; var pc: PosibleColumna);
  { Busca la primera ocurrencia de la cadena `c` en la línea `ln` a partir de la columna `desde`.
    Si la encuentra, retorna en `pc` (pc -> boolean) la columna en la que inicia.  

    Precondiciones: 1 <= desde <= ln.tope }
var
  i          : integer; 
  seEncontro : boolean;
Begin
  pc.esColumna := false; 

  if (c.tope > 0) and (c.tope <= ln.tope) then
  begin
    while (desde <= ln.tope - c.tope + 1) and not pc.esColumna do
    begin
      i := 1; { Posicion del caracter 'c' }
      seEncontro := true;

      while (i <= c.tope) and seEncontro do
      begin
        if ln.cars[desde + i - 1].car <> c.cars[i] then
          seEncontro := false
        else
          i := i + 1;
      end;

      { Guarda la posicion donde inicia la coincidencia de la busqueda, en caso contrario continua buscando. }
      if seEncontro then
      begin
        pc.esColumna := true;
        pc.col := desde;
      end
      else 
        desde := desde + 1;
    end;
  end;
End;


// Opcion 5
procedure buscarCadenaEnTextoDesde ( c: Cadena; txt :Texto; desde: Posicion; var pp: PosiblePosicion );
  { Busca la primera ocurrencia de la cadena `c` en el texto `txt` a partir de la posición `desde`. 
    Si la encuentra, retorna en `pp` la posición en la que inicia. 
    La búsqueda no encuentra cadenas que ocupen más de una línea.

    Precondiciones: 1 <= desde.linea   <= cantidad de líneas 
                    1 <= desde.columna <= tope de línea en desde.linea } 
var
  taux                : Texto;   
  lin, col, limite, i : integer; 
  seEncontro          : boolean;
Begin
  lin := desde.linea; 
  col := desde.columna;
  taux := ubicarLineaEnTexto(txt, lin); { Devuelve un puntero al texto en la línea numero `nln`, comenzando en 1.
                                          Si el texto no tiene una línea en la posición `nln`, devuelve `NIL` }
  pp.esPosicion := false; { Se inicializa de manera de no generar errores inesperados, 
                            y para capturar a continuacion la primera coincidencia }
  while (taux <> nil) and (not pp.esPosicion) do
  begin
    if (c.tope > 0) and (c.tope <= taux^.info.tope) then
    begin
      limite := taux^.info.tope - c.tope + 1;

      while (col <= limite) and (not pp.esPosicion) do
      begin
        i := 1; { Posicion del caracter 'c' }
        seEncontro := true;

        while (i <= c.tope) and seEncontro do
        begin
          if (c.cars[i] <> taux^.info.cars[col + i - 1].car) then
          begin
            seEncontro := false;
          end
          else
            i := i + 1;
        end;

        { Guarda la posicion donde inicia la coincidencia de la busqueda }
        if seEncontro then
        begin
          pp.esPosicion := true;
          pp.p.linea := lin;
          pp.p.columna := col;
        end;

        col := col + 1;
      end;
    end;
    
    { Si no se encontro en la linea actual avanza a la siguiente }
    if not pp.esPosicion then
    begin
      lin := lin + 1;
      taux := ubicarLineaEnTexto(txt, lin);
      col := 1; { Reinicia la posicion de la columna al inicio de la nueva linea }
    end;
  end;
End;


// Opcion 6
procedure insertarCadenaEnLinea(c: Cadena; columna: RangoColumna; var ln: Linea; var pln: PosibleLinea);
  { Inserta la cadena `c` a partir de la `columna` de `ln`, y desplaza hacia la derecha a los restantes caracteres de la línea. 
    Los caracteres insertados toman el formato del carácter que ocupaba la posición `columna` en la línea. 
    - Si la columna es `ln.tope + 1`, entonces queda sin formato. 
    - Si (c.tope + ln.tope) supera `MAXCOL`, los caracteres sobrantes se retornan (en orden) en la posible línea `pln`.

    Precondiciones: 1 <= columna <= ln.tope + 1
                    columna <= MAXCOL
                    c.tope + columna <= MAXCOL }

  procedure insertarCadena(c: Cadena; columna: RangoColumna; var ln: Linea; formatCheck: boolean);
    { Inserta la cadena `c` en la `columna` de `ln` considerando si se debe aplicar formato o no }
    var
      i     : integer;
      tf    : TipoFormato;
      tfAux : array [TipoFormato] of boolean;
    Begin
      if (ln.tope <> 0) then { Caso particular de cuando la linea esta vacia. }
      begin
        for tf:= Neg to Sub do
        begin
          tfAux[tf] := (formatCheck and ln.cars[columna].fmt[tf]);
        end;
      end
      else
      begin
        for tf:= Neg to Sub do
        begin
          tfAux[tf] := false;
        end;        
      end;

      for i := 1 to c.tope do
      begin
        ln.cars[i + columna - 1].car := c.cars[i];
        ln.cars[i + columna - 1].fmt := tfAux;
      end;
  End;

var
  i, carEnNuevaLinea  : integer;
  formatCheck         : boolean;
Begin
  formatCheck := true; 

  { Caso 1, Si la columna es `ln.tope + 1`, entonces queda sin formato }
  if (columna >= ln.tope + 1) then
  begin
      formatCheck := false;
  end;

  { Caso 2, Si (c.tope + ln.tope) supera `MAXCOL`, los caracteres sobrantes se retornan (en orden) en la posible línea `pln`. }
  pln.esLinea := false;  { Se inicializa de manera de no generar errores inesperados }
  if (c.tope + ln.tope > MAXCOL) then
  begin
    pln.esLinea := true; { Se 'habilita' una nueva linea. } 
    carEnNuevaLinea := c.tope + ln.tope - MAXCOL; { Cantidad de cracteres que habra en la nueva linea. --> 'sobrante' }

    for i := 1 to carEnNuevaLinea do 
    begin
      pln.l.cars[i] := ln.cars[MAXCOL - c.tope + i];
    end;
    pln.l.tope := carEnNuevaLinea;
    ln.tope := MAXCOL - c.tope;
  end;
  
  for i := ln.tope downto columna do
  begin
    ln.cars[i + c.tope] := ln.cars[i];
  end;

  insertarCadena(c, columna, ln, formatCheck);
  ln.tope := ln.tope + c.tope;
End;


// Opcion 7
procedure insertarLineaEnTexto(ln: Linea; nln: integer; var txt: Texto);
{ Inserta la línea `ln` en la posición `nln` del texto `txt`.

  Precondiciones: 
                  1 < nln <= cantidad de líneas del texto + 1 }
var
  i                             : integer;
  nuevaLinea, actual, anterior  : Texto;
Begin
  new(nuevaLinea);
  nuevaLinea^.info := ln;
  nuevaLinea^.sig := nil;

  if nln = 1 then
  begin
    nuevaLinea^.sig := txt;
    txt := nuevaLinea;
  end
  else
  begin
    actual := txt;
    anterior := nil;
    i := 1;

    { Recorremos el texto hasta encontrar la posicion deseada }
    while (actual <> nil) and (i < nln) do
    begin
      anterior := actual;
      actual := actual^.sig;
      i := i + 1;
    end;

    if anterior <> nil then
    begin
      anterior^.sig := nuevaLinea;
      nuevaLinea^.sig := actual;
    end;
  end;
End;
