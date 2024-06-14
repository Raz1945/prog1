program Verificar;
var
  i : integer;
  r : real;
begin
  (* la variable i no se encuentra inicializada *)
  (* siempre y cuando i no contenga un valor aleatorio o basura mostrara 0 *)
  r := i + 1; 
  writeLn (i, r)
end.

{
  La salida dependerá del valor inicial de i
}