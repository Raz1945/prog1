program prac4Ej7;
var
  n, i, j, k : integer;
  value : integer;

(* Grafica el valor ingresado *)
procedure Grafica(values: integer);
begin
  for j := value to value do 
    begin
      for k := j downto 1 do
        write('*');
      writeln()
    end;
end;

BEGIN
  writeln('Ingrese un valor para n: ');
  read(n);

  writeln('Ingrese',n:2, ' enteros positivos: ');
  for i := n downto 1 do 
  begin
    read(value);

    Grafica(value)
  end;
END.