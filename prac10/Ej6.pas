program prueba;

type
  TipoMes = (Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio, Agosto, Setiembre, Octubre, Noviembre, Diciembre);
  TipoMesRango = 1..12;

var
  Mes: TipoMes;


procedure MostrarMes(m: TipoMes);
  begin
    case m of
      Enero: writeln('Enero');
      Febrero: writeln('Febrero');
      Marzo: writeln('Marzo');
      Abril: writeln('Abril');
      Mayo: writeln('Mayo');
      Junio: writeln('Junio');
      Julio: writeln('Julio');
      Agosto: writeln('Agosto');
      Setiembre: writeln('Setiembre');
      Octubre: writeln('Octubre');
      Noviembre: writeln('Noviembre');
      Diciembre: writeln('Diciembre');
    end;
  end;
{ Lee por la entrada estandar y imprime el mes }
procedure LeerMes(var m: TipoMes);
var
  mes_aux: TipoMesRango;
begin
  writeln('Ingrese mes (1 - 12): ');
  readln(mes_aux);

  if mes_aux in [1..12] then  { Verifica si el valor está dentro del rango válido }
    m := TipoMes(mes_aux-1)
  else
  begin
    writeln('Mes inválido. Ingrese un valor entre 1 y 12.');
    LeerMes(m);
  end;
  
  MostrarMes(m);
end;

{ Programa Principal }
begin
  LeerMes(Mes);
end.
