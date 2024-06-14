
{ Cuenta la cantidad de caracteres de una palabra }
procedure leerPalabraLargo ( var largo : integer ; var fin : boolean); (* Pasaje de Parametros por Referencias *)
var
  caracterActual : char; 
begin
  largo := 0;

  repeat
    read(caracterActual);
    
    if (caracterActual <> SEPARADOR) and (caracterActual <> FINALIZADOR) then
      begin
        largo := largo + 1; { Cuenta los caracteres, se utiliza para calcular la palabra masLarga ó la masCorta }
        // writeLn('i- ',largo:2,'':2, caracterActual); {Muestra que caracter es el que esta siendo analizado y su correspondiente posición }
      end
    else
    begin
      fin := false;  { El ultimo caracter es FINALIZADOR ? }
      // writeLn(''); {Salto de linea, se utiliza para ver cuando termina una palabra }
    end;
  until (caracterActual = SEPARADOR) or (caracterActual = FINALIZADOR);

  if caracterActual = FINALIZADOR then 
    fin := true;

end;

{ Muestra diferentes datos sobre la oracion ingresada }
procedure leerOracionDatos(var cantPalabras, masLarga, masCorta : integer);
var
  largo : integer;
  fin : boolean;

begin
  cantPalabras := 1; { Asumir que el largo de la palabra es mayor o igual que uno}
  masLarga := 0;
  masCorta := MaxInt;

  repeat
    leerPalabraLargo(largo, fin);

    if not fin then
      cantPalabras := cantPalabras + 1; { Cuenta las palabras }
        
    if (largo > masLarga) then
      masLarga := largo; 

    if (largo < masCorta) then 
      masCorta := largo;

  until fin;
end;
