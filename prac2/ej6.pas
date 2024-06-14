program CalcularTiempo;
{
  Este programa calcula el tiempo total a partir de dos tiempos
  ingresados en formato hhmm (hh:mm) 
}

var
  d, hhmm,
  valor1, valor2,
  hora1, minuto1, hora2, minuto2 
  : integer; 

begin
  read(valor1, valor2);
  // Agregar validacion de datos de entrada, que sea el formato correcto

  (* Cálculo del tiempo total *)
  hhmm := valor1 + valor2;

  (* Extracción de horas y minutos cada tiempo *)
  hora1 := valor1 div 100;
  minuto1 := valor1 mod 100;

  hora2 := valor2 div 100;
  minuto2 := valor2 mod 100;


  writeln('Tiempo 1:');
  writeln('  hh: ', hora1:2, ' mm:', minuto1:4);
  
  writeln('Tiempo 2:');
  writeln('  hh: ', hora2:2, ' mm:', minuto2:4);
  writeln();
  writeln('**Tiempo total:**');
  if (hhmm > 2360) then
  begin
    d := 1;
    hhmm := hhmm - 2360;
    writeln('  d hhmm:', d:2,' ', hhmm:4);
  end
  else
  begin
    d := 0;
    writeln('  d hhmm:', d:2,' ', hhmm:4);

  end;
end.

{
  Notas:
  - ingreso dos valores -> 1345 2153 
  - 'hhmm' se forma de la suma de esos valores, 
    y si esos valores superan los 2360 pasa a ser un dia

  hh respresanta las horas menores de 24 ( hh <= 23 )
  mm representa los minutos menores a 60 ( mm <= 59 )
  hhmm max = 2359
  d representa los dias --> el valor de un dia: 2359 + 1 = 2360
}