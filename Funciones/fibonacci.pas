// program Fibonacci;
// var
//   n, count, j : integer;
//   primo : real;


// function Fib(n : integer):integer;
// var
//   fn, fnm1, fnm2, i: integer;

// begin
//   fnm1 := 1;
//   fnm2 := 1;
//   fn := 0;

//   for i := 3 to (n + 3) do
//   begin
//     fnm1 := fnm2;
//     fnm2 := fn;
//     fn := fnm1 + fnm2;
//   end;
  
//   Fib := fnm2;
// end;

// Begin
//   write('Ingrese el valor de n: ');
//   readln(n);

//   count := 1;
//   while (count <= n) do // Genera 'n' numeros primos
//   begin
//     j := 2;
//     while j <= count do
//     begin
//       primo := Fib(j);
//       j := j + 1;
//     end;
    
//     count := count + 1; // Cuando imprima un numero primo suma 1
//     writeln('n:', (count - 1):2,'--> ':5, 'numero:', primo:2:0)
//   end;

// End.

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
