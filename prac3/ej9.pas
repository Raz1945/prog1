program pr3Ej9; 
var
  num : integer;
  centena,decena : integer;
begin
  (* Entrada de dato *)
  write('Ingrese un numero decimal de a lo sumo 4 cifras: ');
  read(num);

  (* Validacion de la entrada*)
  { No es necesario validar que 'num' es un numero de hasta 4 cifras como max }
  if num < 1000 then
    (* Caso menor a 1000 *)
    writeln('Numero ',num:2)
  else 
  begin
    (* Caso mayor o igual a 1000*)
    centena:= num div 1000;
    decena:= num mod 1000;

    { Salida del numero con un '.' separando la cifra de los millares ( si la hay) de la cifra de las centenas }
    writeln('Nuevo numero ', centena:2, '.', decena:3);
  end;
end.