program pra3Ej10;
const 
  pk1 : integer = 77; (* paquetes de <= 1kg *)
  pk2 : integer = (77 + 56); (* paquetes adicionales > 1kg *)
var
  num : real;
begin
  (* Lectura de datos *)
  write('Ingrese el peso del paquete: ');
  readln(num);

  (* Condicion *)
  if (num < 1) then
    begin
      writeln('Peso: ', num:2:4, ' Costo: ', pk1:2);
    end
  else 
    begin
      writeln('Peso: ', num:2:4, ' Costo: ', pk2:2);
    end
end.
