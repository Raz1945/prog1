program algo;
type
  TRaiz = (RealesDistintas, RealDoble, ComplejasConjugadas);
  TipoRaices = record
                    case tipo : TRaiz  of
                      RealesDistintas: (raiz1, raiz2: real);
                      RealDoble: (raizDoble: real);
                      ComplejasConjugadas: (parteReal, parteImaginaria: real);
  end;

procedure raices(a, b, c: real; var r: TipoRaices);
var
  discriminante, raiz1, raiz2, parteReal, parteImaginaria: real;
begin
  discriminante := sqr(b) -4*a*c;
  writeLn('discriminante:', discriminante:2:2);

  if discriminante > 0 then { Raices reales y distintas}
  begin
    r.tipo := RealesDistintas;
    raiz1 := (-b + sqrt(discriminante)) / (2*a);
    raiz2 := (-b - sqrt(discriminante)) / (2*a);      
    r.raiz1 := raiz1;
    r.raiz2 := raiz2;
    writeln('Raices reales distintas: ',raiz1:2:2, ' y ',raiz2:2:2);
  end
  else if discriminante = 0 then { Raiz real doble}
  begin
    r.tipo := RealDoble;
    raiz1 := -b / (2*a);
    r.raizDoble := raiz1;
    writeln('Raiz real doble: ', r.raizDoble:2:2);

  end
  else { Raices complejas}
  begin
    r.tipo := ComplejasConjugadas;
    parteReal := -b / (2*a);
    parteImaginaria := sqrt(-discriminante) / (2*a);
    r.parteReal := parteReal;
    r.parteImaginaria := parteImaginaria;
    writeln('Raices complejas conjugadas: ', r.parteReal:2:2, ' +/- ', r.parteImaginaria:2:2, 'i');
  end;
end;

// Programa principal
var
  a, b, c: real;
  r: TipoRaices;
begin
  a := 1.0;
  b := -3.0;
  c := 2.0;
  raices(a, b, c, r);
end.