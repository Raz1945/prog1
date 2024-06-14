
program prac6Ej4;
var
  n, count, i : integer;
  raiz : real;
  primo : boolean;

function EsPrimo(num: integer): boolean;
var
  j: integer;
begin
  primo := true;
  for j := 2 to Trunc(Sqrt(num)) do
  begin
    if num mod j = 0 then
      primo := false;
  end;
  EsPrimo := primo;
end;

Begin
  write('Ingrese el valor de n: ');
  readln(n);
  
  count := 0; // Contador de vueltas de 'n'
  i := 2; // Comenzamos desde el primer número primo (2)
  while count < n do
  begin
    if EsPrimo(i) then
    begin
      raiz := Sqrt(i);
      writeln('n:', count + 1:2, ' --> Primo:', i:2, '  Raiz: ', raiz:2:2);
      count := count + 1;
    end;
    i := i + 1;
  end;
End.
