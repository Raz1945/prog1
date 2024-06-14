program Balance;
var
  sdInicial, sdFinal, valor: Real;
  letra: char;

Begin
  write('Ingrese el Saldo Inicial: ');
  readln(sdInicial);

  sdFinal := sdInicial;
  valor := 0;

  repeat
    // write('Tipo de proceso (D para depósito, R para retiro, X para salir): ');
    // readln(letra);
    read(letra);
    
    if not (letra = 'X') or (letra = 'x') then
    begin
      case letra of
        'D', 'd':
          begin
            // write('Valor de deposito: ');
            // readln(valor);
            read(valor);
            sdFinal := sdFinal + valor;
          end; 
        'R', 'r': 
          begin
            // write('Valor del retiro: ');
            // readln(valor);
            read(valor);
            sdFinal := sdFinal - valor;
          end;
        'X', 'x': writeln('Saliendo.');
        else
          writeln('ERROR: Proceso no reconocido. Utilice D para depósitos, R para retiros o X para salir.');
      end;
    end;
  until (letra = 'X') or (letra = 'x');

  writeln('El Saldo Final es: ', sdFinal:2:2);
End.
