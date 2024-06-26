program workspace;

{$INCLUDE definiciones.pas}
{$INCLUDE TAREA2.pas}





procedure imprimirLinea(txt: Texto; desde: Posicion);
var
  lin : Texto;
  i   : integer;
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



// Programa Principal
var
  tienenFormato: boolean;


  txt, taux  : Texto;
  pos        : Posicion;
  c          : Cadena;
  tf         : TipoFormato;
  pl         : PosibleLinea;

Begin
  { inicializo el texto }
  write('Ingrese Nombre de Archivo: ');
  leerTexto(txt);

  write ('Ingrese linea: ');
  readln (pos.linea);

  // writeln;
  // write ('Ingrese columna: ');
  // readln (pos.columna); // La posicion (o columna) donde se agregara la cadena de texto.
  // writeln;

  // write('Ingrese cadena: ');
  // leerCadena(c);

  taux := ubicarLineaEnTexto (txt, pos.linea); // Dado un texto ubica la linea seleccionada en él.

  //-----------------//
    { Supongamo que seleccionamos la linea 3, del texto4: 
      ` Its a Sith legend. Darth Plagueis was a Dark Lord of the Sith, ` 
      lin.tope = 62; --> Faltado 18 caracteres para alcanzar el MAXCOL.
    }

    aplicarFormatoEnLinea(Sub, 1, taux^.info.tope, taux^.info);
    for tf := Neg to Sub do
    begin
      if todosTienenFormatoEnLinea(tf, 1, taux^.info.tope, taux^.info) then
      begin
        writeln('tiene formato');
        mostrarLinea(taux^.info);
      end
      else 
        writeln('No tiene formato');
    end;


    
    // // Se le agregar un formato como ejemplo. 
    // for tf := Neg to Sub do
    // begin
    //   if todosTienenFormatoEnLinea(tf, 1, taux^.info.tope, taux^.info) then 
    //     tienenFormato := true
    //   else
    //     tienenFormato := false;
    // end;
    // { Suponemos que los primeros 18 caracteres tiene formato }
    // if not tienenFormato then
    // begin
    //   aplicarFormatoEnLinea(Sub, 1, 18, taux^.info);

    //   aplicarFormatoEnLinea(Neg, 1, 18, taux^.info);
    // end;
  //-----------------//

  // insertarCadenaEnLinea(c, pos.columna, taux^.info, pl); //* En la que estoy trabajando
  // writeln;
  // write('Linea sobrante: ');
  // mostrarPosibleLinea(pl); //todo VER 
  // if pl.esLinea then
  // begin
  //     write('Se insertar la linea sobrante como siguiente...');
  //     // write('Insertar linea sobrante como siguiente? [0=no,1=si]');
  //     // readln(opcion);
  //     // if opcion = 1 then insertarLineaEnTexto(pl.l,pos.linea+1,txt) // Puntero
  // end;


  
  // writeln;
  // mostrarLinea(taux^.info);
End.
