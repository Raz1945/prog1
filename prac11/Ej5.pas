program prac11Ej5;

type
  TNat = 0..Maxint;

  TError = (diverr, reserr, argerr); { Error de División, Resta o por Argumento }
  TEstado = (correcto, incorrecto);
  TNerr = record
    case estado: TEstado of
      correcto: (num: TNat);
      incorrecto: (err: TError);
  end;

procedure division(a, b: TNerr; var resu: TNerr);
begin
  if (a.estado = correcto) and (b.estado = correcto) then
  begin
    if b.num = 0 then { Caso de error: b = 0 }
    begin
      resu.estado := incorrecto;
      resu.err := diverr; 
    end
    else { Caso correcto }
    begin
      resu.estado := correcto;
      resu.num := a.num div b.num;
    end;
  end
  else { Caso de error por argumento inválido }
  begin
    resu.estado := incorrecto;
    resu.err := argerr;
  end;
end;

procedure resta(a, b: TNerr; var resu: TNerr);
begin
  if (a.estado = correcto) and (b.estado = correcto) then
  begin
    if (a.num < b.num) then
    begin
      resu.estado := incorrecto;
      resu.err := reserr;
    end
    else
    begin
      resu.estado := correcto;
      resu.num := a.num - b.num;
    end;
  end
  else
  begin
    resu.estado := incorrecto;
    resu.err := argerr;
  end;
end;

procedure suma(a, b: TNerr; var resu: TNerr);
begin
  if (a.estado = correcto) and (b.estado = correcto) then
  begin
    resu.estado := correcto;
    resu.num := a.num + b.num;
  end
  else
  begin
    resu.estado := incorrecto;
    resu.err := argerr;
  end;
end;

procedure producto(a, b: TNerr; var resu: TNerr);
begin
  if (a.estado = correcto) and (b.estado = correcto) then
  begin
    resu.estado := correcto;
    resu.num := a.num * b.num;
  end
  else
  begin
    resu.estado := incorrecto;
    resu.err := argerr;
  end;
end;

{ Sin whit }
procedure mostrarResultado(resu: TNerr);
begin
  if resu.estado = incorrecto then
  begin
    case resu.err of
      diverr: writeln('ERROR: No se puede dividir entre cero => b = 0');
      reserr: writeln('ERROR: Resultado negativo => a < b');
      argerr: writeln('ERROR: Alguno de los argumentos no son validos');
    end;
  end
  else
    writeln('Resultado: ', resu.num:2);
end;

{Con whi}
// procedure mostrarResultado(resu: TNerr);
// begin
//   with resu do
//   begin
//     if estado = incorrecto then
//     begin
//       case err of
//         diverr: writeln('ERROR: No se puede dividir entre cero');
//         reserr: writeln('ERROR: Resultado negativo');
//         argerr: writeln('ERROR: Argumento inválido');
//       end;
//     end
//     else
//       writeln('Resultado: ', num:2);
//   end;
// end;

// Programa principal
var
  a, b, resu: TNerr;

begin
  a.estado := correcto;
  a.num := 3;

  b.estado := correcto;
  b.num := 0;

  division(a, b, resu);
  mostrarResultado(resu);

  b.num := 4;  
  resta(a, b, resu);
  mostrarResultado(resu);

  suma(a, b, resu);
  mostrarResultado(resu);

  producto(a, b, resu);
  mostrarResultado(resu);
end.
