{ NOTA: Las precondiciones son condiciones que se asume serán cumplidas al invocarse el subprograma,
        por lo que no deben chequearse }

// todo ->
        //? Cuando usar variables auxiliares en las funciones y cuando utilizar los parametros del encabezado. 
        //? Se deberan validar los valores ingresados de **TipoFormato** ?
        //? Se deberia verificar que se cumplan las constantes?

// Opcion 1
function todosTienenFormatoEnLinea(tfmt: TipoFormato; ini, fin: RangoColumna; ln: Linea): boolean;
  { Retorna true solo si todos los caracteres de `ln` entre las columnas `ini` y `fin`, incluídos los extremos, tienen el formato `tfmt`.
    En otro caso retorna false 

    Precondiciones: 1 <= ini <= ln.tope;
                    1 <= fin <= ln.tope }
var
  tieneFormato: boolean;
Begin
  tieneFormato := true;

  while (ini <= fin) and tieneFormato do
  begin
    { Verifica que el caracter tenga algun formato establecido }
    if not ln.cars[ini].fmt[tfmt] then
      tieneFormato := false;  
    //? Se podria agregar un 'else' para los casos donde se ingresan valores de TipoFormato incorrectos 

    ini := ini + 1; 
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
  i   : integer; //? Deberia ser RangoColumna?
  lin : Linea;
Begin
  lin := ln; { aux. linea }

  for i := ini to fin do    
  begin
    case tfmt of 
      Neg: lin.cars[i].fmt[Neg] := not lin.cars[i].fmt[Neg];
      Ita: lin.cars[i].fmt[Ita] := not lin.cars[i].fmt[Ita];
      Sub: lin.cars[i].fmt[Sub] := not lin.cars[i].fmt[Sub];
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
procedure buscarCadenaEnLineaDesde ( c: Cadena; ln: Linea; desde: RangoColumna; var pc: PosibleColumna );
  { Busca la primera ocurrencia de la cadena `c` en la línea `ln` a partir de la columna `desde`.
    Si la encuentra, retorna en `pc` (pc -> boolean) la columna en la que incia.  

    Precondiciones: 1 <= desde <= ln.tope }
var
  ini, i     : integer; 
  seEncontro : boolean;
Begin

  { Verifico si el arreglo Cadena es mayor a cero y debera ser
    menor o igual que el arreglo 'Linea' sino lo es, no debe de entrar en la busqueda }
  if (c.tope > 0) and (c.tope <= ln.tope) then
  begin
    ini := desde; { Columna donde inicia la busqueda }

      {Notas: }
        { Siendo ini = 3, ln.tope = 10, c.tope = 4 => 3 <= ( 10 - 4 + 1 ) = 7, 
          ==> 7 es la cantidad maxima de caracteres que se pueden recorrer }
    while (ini <= ln.tope - c.tope + 1) do
    begin
      i := 1; { Indice de C ~ Indica la posicion del caracter Cadena }
      seEncontro := true;

      while (i <= c.tope) and seEncontro do
      begin
        if ln.cars[ini + i - 1].car <> c.cars[i] then
          seEncontro := false
        else
          i := i + 1;
      end;

      { Guarda la posicion donde inicia la esCoincidencia de la busqueda }
      if seEncontro then
      begin
        pc.esColumna := true;
        pc.col := ini;
      end;

      ini := ini + 1;
    end;
  end;
End;


// Opcion 5
procedure buscarCadenaEnTextoDesde ( c: Cadena; txt :Texto; desde: Posicion; var pp: PosiblePosicion );
  { Busca la primera ocurrencia de la cadena `c` en el texto `txt` a partir de la posición `desde`. 
    Si la encuentra, retorna en `pp` la posición en la que inicia. 
    *La búsqueda no encuentra cadenas que ocupen más de una línea.*

    Precondiciones: 1 <= desde.linea   <= cantidad de líneas 
                    1 <= desde.columna <= tope de línea en desde.linea } 
var
  taux                : Texto;   
  lin, col, limite, i : integer; 
  esCoincidencia      : boolean;
Begin
  lin := desde.linea; 
  col := desde.columna;

  taux := ubicarLineaEnTexto(txt, lin); { Devuelve un puntero al texto en la línea numero `nln`, comenzando en 1.
                                          Si el texto no tiene una línea en la posición `nln`, devuelve `NIL` }

  { Verifico si el arreglo 'c' Cadena es mayor a cero y
    debera ser  menor o igual al valor del tope de la linea seleccionada } 
  if (c.tope > 0) and (c.tope <= taux^.info.tope) then
  begin
    pp.esPosicion := false; { Se inicializa de manera de no generar errores inesperados, y para capturar a continuacion la primera coincidencia }
    limite := taux^.info.tope - c.tope + 1; 

    while (taux <> nil) and (col <= limite) and (not pp.esPosicion) do
      begin
        i := 1; { Indice de c ~ Indica la posicion del caracter Cadena }
        esCoincidencia := true;

        { Recorre cada caracter de la cadena `c` y lo compara con la linea de texto actual }
        while (i <= c.tope) and esCoincidencia do
        begin
          // writelin('':4,'Caracter[',i:0,'] : ', c.cars[i]);
          if (c.cars[i] <> taux^.info.cars[col + i - 1].car) then
          begin
            // write('[',i:0,':] ', c.cars[i]);
            // writelin(' vs [', col:0,']:', taux^.info.cars[col].car);
            esCoincidencia := false;
          end
          else
            i := i + 1;
        end;
          
        { Guarda la posicion donde inicia la coincidencia de la busqueda }
        if esCoincidencia then
        begin
          pp.esPosicion := true;
          pp.p.linea := lin;
          pp.p.columna := col;
        end;

        col := col + 1; { avanza al siguiente caracter de la linea seleccionada }
    end;
  end;
End;



// Caso 6
procedure insertarCadenaEnLinea(c: Cadena; columna: RangoColumna; var ln: Linea; var pln: PosibleLinea);
  { Inserta la cadena `c` a partir de la `columna` de `ln`, y desplaza hacia la derecha a los restantes caracteres de la línea. 
    Los caracteres insertados toman el formato del carácter que ocupaba la posición `columna` en la línea. 
    - Si la columna es `ln.tope + 1`, entonces queda sin formato. 
    - Si (c.tope + ln.tope) supera `MAXCOL`, los caracteres sobrantes se retornan (en orden) en la posible línea `pln`.

    Precondiciones: 1 <= columna <= ln.tope + 1
                    columna <= MAXCOL
                    c.tope + columna <= MAXCOL }

  //todo REVISAR
    procedure insertarCadena(c: Cadena; columna: RangoColumna; var ln: Linea; conFormato: boolean);
    { Inserta la cadena `c` en la `columna` de `ln` considerando si se debe aplicar formato o no }
    var
      i   : integer;
      lin : Linea;
    Begin
      lin := ln;
      for i := 1 to c.tope do
      begin
        lin.cars[i + columna - 1].car := c.cars[i];
        if conFormato then
          lin.cars[i + columna - 1].fmt := lin.cars[columna].fmt;  { Aplica el formato }
      end;
    End;

var
  i, ini, fin     : integer;
  // lin             : Linea;
  tf              : TipoFormato; // TipoFormato => (Neg, Ita, Sub)
  tieneFormato    : boolean;

  carEnNuevaLinea : integer; 
Begin
  ini := 1;       { Columna de inicio }
  fin := ln.tope; { Ultima columna ~ Cantidad maxima de caracteres que posee la linea }
  tieneFormato := false; 

  { Verificar si los caracteres de la linea tienen algun formato inicialmente }
  for tf := Neg to Sub do
  begin
    if todosTienenFormatoEnLinea(tf, ini, fin, ln) then 
      tieneFormato := true;
  end;

  { Determinar en qué posición se va a insertar }
  if (columna >= fin + 1) then
  begin
    insertarCadena(c, columna, ln, false);
  end
  else 
  begin
    if (c.tope + fin > MAXCOL) then
    begin
      pln.esLinea := true; // Se 'habilita' una nueva linea. 
      carEnNuevaLinea := c.tope + fin - MAXCOL; // Caracteres en la nueva linea

      for i := 1 to carEnNuevaLinea do 
      begin
        pln.l.cars[i] := ln.cars[MAXCOL - c.tope + i];
        writeln('Caracter en nueva linea: ', pln.l.cars[i].car);
      end;

      pln.l.tope := carEnNuevaLinea;
      fin := MAXCOL - c.tope;
    end;

    for i := fin downto columna do
    begin
      ln.cars[i + c.tope] := ln.cars[i];
    end;

    insertarCadena(c, columna, ln, tieneFormato);
  end;

  { Actualizo el tope de la linea }
  ln.tope := fin + c.tope;
End;





// todo
procedure insertarLineaEnTexto ( ln : Linea; nln : integer; var txt : Texto );
{ Inserta la línea `ln` en la posición `nlin` del texto `txt`.

  Precondiciones: 1 < nln <= cantidad de líneas del texto + 1
}
begin
end;
