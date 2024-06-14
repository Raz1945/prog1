
program SerieInfinita;
{
  Este programa calcula la suma de los primeros cinco términos de la serie
  infinita 1 + x/1! + x^2/2! + x^3/3! + x^4/4! y el valor de exp(x)
  para un valor real x entre 0.0 y 1.0.
}
var
  inputNum, serieNum, expNum: real;
  
(* Calcula el factorial de un número. *)
function Factorial(num: integer): real;  
  { -> Se espera que la salida sea del tipo real, 
    ya que la division al momento de calcular la serie,
    es del tipo real
  }
var
  i: integer;
  factor: real; 
begin
  factor := 1;
  for i := 1 to num do
    factor := factor * i; 
  Factorial := factor;
end;

(* Calcula la Serie de los primeros cinco terminos *)
function getSerieInginita(num : real ):real;
var
  serie1, serie2, serie3, serie4 : real;
begin
  serie1 :=  num /Factorial(1); 
  serie2 := (num * num) /Factorial(2);
  serie3 := (num * num * num ) /Factorial(3);
  serie4 := (num * num * num * num ) /Factorial(4);
  
  getSerieInginita := 1 + serie1 + serie2 + serie3 + serie4;
end;

begin
  (* Lectura del número real *)
  write('Introduzca un numero real entre 0.0 y 1.0: ');
  read(inputNum);
  
  (* Validación de entrada *)
  if (not (inputNum > 0.0)) or (inputNum >= 1.0) then
  begin
    writeln('Error: El número debe estar entre 0.0 y 1.0.');
    halt;
  end;

  (* Cálculo de la serie infinita *)
  serieNum := getSerieInginita(inputNum);

  (* Cálculo de exp(x) *)
  expNum := exp(inputNum);

  (* Salida del resultado *)
  writeln('Numero introducido = ', inputNum:4);
  writeln('Suma de los primeros 5 terminos = ', serieNum);
  writeln('Valor de exp(x) = ', expNum);
end.


(* --> Otra version sin usar 'halt'*)
// program SerieInfinita;
// {
//   Este programa calcula la suma de los primeros cinco términos de la serie
//   infinita 1 + x/1! + x^2/2! + x^3/3! + x^4/4! y el valor de exp(x)
//   para un valor real x entre 0.0 y 1.0.
// }
// var
//   inputNum, serieNum, expNum: real;
  
// (* Calcula el factorial de un número. *)
// function Factorial(num: integer): real;  
//   { -> Se espera que la salida sea del tipo real, 
//     ya que la division al momento de calcular la serie,
//     es del tipo real
//   }
// var
//   i: integer;
//   factor: real; 
// begin
//   factor := 1;
//   for i := 1 to num do
//     factor := factor * i; 
//   Factorial := factor;
// end;

// (* Calcula la Serie de los primeros cinco terminos *)
// function getSerieInginita(num : real ):real;
// var
//   serie1, serie2, serie3, serie4 : real;
// begin
//   serie1 :=  num /Factorial(1); 
//   serie2 := (num * num) /Factorial(2);
//   serie3 := (num * num * num ) /Factorial(3);
//   serie4 := (num * num * num * num ) /Factorial(4);
  
//   getSerieInginita := 1 + serie1 + serie2 + serie3 + serie4;
// end;

// begin
//   (* Lectura del número real *)
//   write('Introduzca un numero real entre 0.0 y 1.0: ');
//   read(inputNum);
  
//   (* Validación de entrada *)
//   if (inputNum > 0.0) and (inputNum < 1.0) then
//   begin

//     (* Cálculo de la serie infinita *)
//     serieNum := getSerieInginita(inputNum);

//     (* Cálculo de exp(x) *)
//     expNum := exp(inputNum);

//     (* Salida del resultado *)
//     writeln('Numero introducido = ', inputNum:4);
//     writeln('Suma de los primeros 5 terminos = ', serieNum);
//     writeln('Valor de exp(x) = ', expNum);
//   end
//   else
//     writeln('Error: El numero debe estar entre 0.0 y 1.0.');
// end.

