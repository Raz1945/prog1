
{ leerPalabraLargo.pas }

{ Cuenta la cantidad de caracteres de una palabra }
procedure leerPalabraLargo ( var largo : integer ; var fin : boolean);
var
  caracterActual : char;
  i : integer;

begin
  i := 0;

  repeat
    read(caracterActual);
    
    if (caracterActual <> SEPARADOR) and (caracterActual <> FINALIZADOR)then
      begin
        i := i + 1; { Cuenta los caracteres, se utiliza para calcular la palabra masLarga ó la masCorta }
        // writeLn('i- ',i:2,'':2, caracterActual); {Muestra que caracter es el que esta siendo analizado y su correspondiente posición }
      end
    else
    begin
      fin := false;  { El ultimo caracter es FINALIZADOR ? }
      // writeLn(''); {Salto de linea, se utiliza para ver cuando termina una palabra }
    end;
  until (caracterActual = SEPARADOR) or (caracterActual = FINALIZADOR);

  if caracterActual = FINALIZADOR then 
    fin := true;

  largo := i;
end;
