{ Funciones y prcesos creados }

// Caso 1
//todo Se podria agregar un 'else' para los casos donde se ingresan valores de TipoFormato incorrectos 
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


// Caso 2
//todo Se podria agregar un 'else' para los casos donde se ingresan valores de TipoFormato incorrectos 
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


// Caso 3
function contarCaracteresEnTexto ( txt: Texto ) : integer;
{ Retorna la cantidad de caracteres que tiene el texto `txt` }

//? Al momento de contar la cantidad de caracteres, los espacio y saltos de linea cuentan?  
//R Los espacios cuenta.
//R los saltos de linea se dan si se supera la cantidad de caracteres permitidos por linea. 
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


// Caso 4
// todo --> Revisar si implementar +variables aux.
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

    { i = 3, ln.tope = 10, c.tope = 4 
      => 3 <= ( 10 - 4 + 1 ) = 7, ==> 7 es la cantidad maxima de caracteres que se pueden recorrer. }
    while (i <= ln.tope - c.tope + 1) do
    begin
      j := 1;
      seEncontro := true;
      
      // ? Podria utilizarse un for?
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

// Caso 5
procedure buscarCadenaEnTextoDesde ( c: Cadena; txt :Texto; desde: Posicion; var pp: PosiblePosicion );
{ Busca la primera ocurrencia de la cadena `c` en el texto `txt` a partir de la posición `desde`. 
  Si la encuentra, retorna en `pp` la posición en la que inicia. 
  **La búsqueda no encuentra cadenas que ocupen más de una línea.** }

{ Precondiciones: 1 <= desde.linea <= cantidad de líneas 
                  1 <= desde.columna <= tope de línea en desde.linea } 
var
  lin                       : Texto;   { lineaActual }
  ln, cl, limiteLin, indCar : integer; { ln = n de lineas, cl = n de columnas }
  coincidencia              : boolean;
begin
  ln := desde.linea;
  cl := desde.columna;

  lin := ubicarLineaEnTexto(txt, ln);

  { Verifico si el arreglo 'c' Cadena es mayor a cero 
    y debera ser  menor o igual al valor del tope de la linea seleccionada } 
  if (c.tope > 0) and (c.tope <= lin^.info.tope) then
  begin
    pp.esPosicion := false; { Se inicializa para no generar errores inesperados, y para capturar a continuacion la primera coincidencia }
    limiteLin := lin^.info.tope - c.tope + 1; 

    while (lin <> nil) and (cl <= limiteLin) and (not pp.esPosicion) do
      begin
        indCar := 1;
        coincidencia := true;

        { Recorre cada caracter de la cadena `c` y lo compara con la linea de texto actual }
        while (indCar <= c.tope) and coincidencia do
        begin
          // writeln('':4,'Caracter[',indCar:0,'] : ', c.cars[indCar]);

          if (c.cars[indCar] <> lin^.info.cars[cl + indCar - 1].car) then
          begin
            // write('[',indCar:0,':] ', c.cars[indCar]);
            // writeln(' vs [', cl:0,']:', lin^.info.cars[cl].car);
            coincidencia := false;
          end
          else
            indCar := indCar + 1;
        end;
          
        { Guarda la posicion donde inicia la coincidencia de la busqueda }
        if coincidencia then
        begin
          pp.esPosicion := true;
          pp.p.linea := ln;
          pp.p.columna := cl;
        end;

        cl := cl + 1; { avanza al siguiente caracter de la linea seleccionada }
    end;
  end;
end;
