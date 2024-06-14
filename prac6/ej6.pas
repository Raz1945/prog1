program prac6Ej6;

const
  GTOFIJO: integer = 100;
  GAMUSINO: integer = 30;

var
  gtoPublicidad, vtaInicial, vtaPorcentual, vtaTotal, neto, netoFinal, netoMaximo, gtoMaximo, vtaTotalMaximo: integer;

begin
  write('Ingrese el gasto inicial de publicidad: ');
  readln(gtoPublicidad);

  vtaInicial := 20;
  vtaPorcentual := 0;
  vtaTotal := vtaInicial + vtaPorcentual;

  neto := 0;
  netoFinal := (vtaTotal * GAMUSINO) - GTOFIJO - gtoPublicidad;
  netoMaximo := netoFinal;

  (* Mensaje de Salida inicial *)
  writeln('gtoPubliciad':16, 'Ventas':10, 'Neto':10);
  writeln(gtoPublicidad:16, vtaTotal:10, netoFinal:10);

  repeat
    neto := netoFinal;

    (* Calcula el nuevo gasto en publicidad *)
    gtoPublicidad := gtoPublicidad * 2;
    write(gtoPublicidad:16);

    (* Calcula el % de venta *)
    vtaPorcentual := vtaTotal DIV 2;

    (* Total de las ventas *)
    vtaTotal := vtaTotal + vtaPorcentual;
    write(vtaTotal:10);

    (* Calcula el neto *)
    netoFinal := (vtaTotal * GAMUSINO) - GTOFIJO - gtoPublicidad;
    write(netoFinal:10);

    (* Actualiza el netoMaximo si el nuevo netoFinal es mayor *)
    if netoFinal > netoMaximo then
      begin
        netoMaximo := netoFinal;
        gtoMaximo := gtoPublicidad;  
        vtaTotalMaximo := vtaTotal; 
      end;

    writeln(''); // Salto de linea
  until (neto > netoFinal);

  writeln(''); // Salto de linea

  (* Mostrar el neto maximo y su configuración *)
  writeln('Neto maximo:', netoMaximo:2);
  writeln('Gasto en publicidad maximo:', gtoMaximo:2);
  writeln('Ventas totales maximas:', vtaTotalMaximo:2);

  writeln(''); // Salto de linea
  writeln('FIN.');
end.
