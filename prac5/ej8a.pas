program prac5Ej8;
var
  operador : char;
  numero, total: integer;
Begin
  read(numero);
  read(operador);

  total := numero;

  while (operador <> '=') do
  begin
    
    read(numero);
    // writeln('new numero: ',numero:2);(* Para el valor del numero actual *)

    case operador of
      '+': total := total + numero;
      '-': total := total - numero;
      '*': total := total * numero;
      '/': total := total DIV numero;
    else
      writeln('ERROR, operador no permitido.');
    end;

    read(operador);
    // writeln('new Operador: ',operador);(* Para ver el operador que interactua *)

    // writeln('total: ', total:2);(* Para ver el total actual *)
  end;
    write(total:2);
End.