program pruebaTarea2;

{$INCLUDE definiciones.pas}

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

procedure imprimirLinea(txt: Texto; desde: Posicion);
var
  lin: Texto;
  i: integer;
begin
  lin := ubicarLineaEnTexto(txt, desde.linea);
  
  if lin <> nil then
  begin
    writeln('El tope de la linea seleccionada es: ', lin^.info.tope);
    
    for i := desde.columna to lin^.info.tope do
      write(lin^.info.cars[i].car);
    
    writeln;
  end
  else
    writeln('Linea no encontrada');
  
end;






{ # "Programa principal" }
{ --------------------------------------------------- }
var
  ln : integer;
  txt : Texto;
  lin        : Linea;
  ini,fin    : integer;
  pos        : Posicion;
  c          : Cadena;
  pc         : PosibleColumna;
  pp         : PosiblePosicion;
  pl         : PosibleLinea;

begin
  { inicializo el texto }
  write('Ingrese Nombre de Archivo: ');
  leerTexto(txt);
  
  pos.linea := 3;
  pos.columna := 1;

  { Linea en la que estoy buscando }
  imprimirLinea(txt, pos);

  { Texto a buscar: }
  writeln ('Ingrese texto a buscar: ');
  leerCadena(c);

  buscarCadenaEnTextoDesde(c, txt, pos, pp);
  
  writeln ('Resultado: ');
  mostrarPosiblePosicion (pp);
  
  if pp.esPosicion then
  begin
      lin := ubicarLineaEnTexto (txt, pp.p.linea)^.info;
      mostrarLineaCol (lin, pp.p.columna)
  end

end.
