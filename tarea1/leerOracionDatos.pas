
{$INCLUDE leerPalabraLargo.pas}

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
        
    if (largo >= masLarga) then
      masLarga := largo;

    if (largo <= masCorta) then 
      masCorta := largo;

  until fin;
end;
