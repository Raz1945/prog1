program ej1;
type
  TAlfabeto = array [1..26] of char;

  function siguiente(c: Char): Char;
  begin
    if c = 'Z' then
      siguiente := 'A'
    else
      siguiente := succ(c)
  end;

  function desplazamiento(alf: TAlfabeto): Integer;
  var i,desp,res: Integer;
  begin
    res := -1;
    desp := ord(alf[1]) - ord('A');

    if (0 <= desp) and (desp <= 25) then
    begin
      i := 2;
      while (i <= 26) and (alf[i] = siguiente(alf[i-1])) do
        i := i+1;

      if i > 26 then
        res := desp
    end;

    desplazamiento := res
  end;

var
  alf1, alf2, alf3: TAlfabeto;
  i: integer;
begin
  // Inicialización de alf1 con un desplazamiento de 3 (cifrado César)
  for i := 1 to 26 do
    alf1[i] := chr(65 + (i + 2) mod 26); // 'A' -> 'D', 'B' -> 'E', etc.

  // Inicialización de alf2 con un desplazamiento de 1 (cifrado César)
  for i := 1 to 26 do
    alf2[i] := chr(65 + (i) mod 26); // 'A' -> 'B', 'B' -> 'C', etc.

  // Inicialización de alf3 como alfabeto normal (sin desplazamiento)
  for i := 1 to 26 do
    alf3[i] := chr(64 + i); // 'A', 'B', 'C', ..., 'Z'

  // Ejemplo de uso de la función desplazamiento
  writeln('Desplazamiento en alf1: ', desplazamiento(alf1)); // Debería ser 3
  writeln('Desplazamiento en alf2: ', desplazamiento(alf2)); // Debería ser 1
  writeln('Desplazamiento en alf3: ', desplazamiento(alf3)); // Debería ser -1
end.
