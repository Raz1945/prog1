{ NOTA: Las precondiciones son condiciones que se asume serán cumplidas al invocarse el subprograma,
        por lo que no deben chequearse. }

// todo ->
        //? Cuando usar variables auxiliares en las funciones y cuando utilizar los parametros del encabezado. 
        //? Se deberan validar los valores ingresados de **TipoFormato** ?
        //? Se deberia verificar que se cumplan las constantes?


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
    //* ln.cars[i].fmt[tfmt] := not ln.cars[i].fmt[tfmt]; { Manera mas 'compacta'}
    case tfmt of 
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
  { Verifico si el arreglo Cadena mayor a cero. Y que sea menor o igual que el arreglo 'Linea'. 
    Sino lo es no debe de entrar en la busqueda. }
  if (c.tope > 0) and (c.tope <= ln.tope) then
  begin
    i := desde;
    
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


// todo
procedure buscarCadenaEnTextoDesde ( c: Cadena; txt :Texto; desde: Posicion
                                  ; var pp: PosiblePosicion );
{ Busca la primera ocurrencia de la cadena `c` en el texto `txt` a partir de la 
  posición `desde`. Si la encuentra, retorna en `pp` la posición en la que incia. 
  La búsqueda no encuentra cadenas que ocupen más de una línea.

  Precondiciones: 1 <= desde.linea <= cantidad de líneas 
                  1 <= desde.columna <= tope de línea en desde.linea } 
begin
end;


// todo
procedure insertarCadenaEnLinea ( c : Cadena; columna : RangoColumna
                                ; var ln : linea; var pln : PosibleLinea );
{ Inserta la cadena `c` a partir de la `columna` de `ln`, y desplaza hacia la derecha 
  a los restantes caracteres de la línea. Los carácteres insertados toman el formato 
  del carácter que ocupaba la posición `columna` en la línea. Si la columna es 
  `ln.tope+1`, entonces queda sin formato.
  Si (c.tope + lin.tope) supera `MAXCOL`, los carácteres sobrantes se retornan (en
  orden) en la posible línea `pln`.

  Precondiciones:  1 <= columna <= ln.tope+1
                  columna <= MAXCOL
                  c.tope + columna <= MAXCOL  }  
begin
end;

// todo
procedure insertarLineaEnTexto ( ln : Linea; nln : integer; var txt : Texto );
{ Inserta la línea `ln` en la posición `nlin` del texto `txt`.

  Precondiciones: 1 < nln <= cantidad de líneas del texto + 1
}
begin
end;
