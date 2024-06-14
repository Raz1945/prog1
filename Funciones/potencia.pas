program Potencia;
{ 
  potencia = a^exponente
}

var
  a,exponente, resultado, i: integer;
  
procedure Potencia(a, exponente : integer);
begin
  resultado := 1;
  for i := 1 to exponente do
    resultado := resultado  * a;
end;

Begin
  a := 2; (* Cambiar manualmente *)
  exponente := 3; (* Cambiar manualmente *)

  Potencia(a,exponente); (* Invoca el procedimiento *)

  writeLn('valor ingresado', a:2,'^',exponente:1);
  writeLn('Resultado = ', resultado:2);
End.

