program parc2018;
var
  i, i0 , num : integer;
  hayCero : boolean;
Begin
  read(num);
  
  i := 0; { posicion general }
  i0 := 0; { posicion que ocupa el 0 }
  hayCero := false;

  while num <> -1 do
  begin
    i := i + 1;

    if num = 0 then 
    begin
      i0 := i;
      hayCero := true;
    end;

    read(num);
  end;

  if hayCero then
    writeln('salida: ', i0:2)
  else
    writeln('salida: -1');
End.
