function estanCharIncluidos(cad1, cad2: TCadena): Boolean;
var
  i, j: Integer;
  incluido: Boolean;
begin
  // Inicialmente asumimos que todos los caracteres están incluidos
  incluido := True;
  
  i := 1;
  while (i <= Max) and incluido do
  begin
    j := 1;
    // Buscamos el carácter de cad1 en cad2
    while (j <= Max) and (cad1[i] <> cad2[j]) do
      j := j + 1;
    // Si no encontramos el carácter, cambiamos la bandera a False
    incluido := j <= Max;

    i := i + 1;
  end;
  
  estanCharIncluidos := incluido;
end;
