program Ej3;

type
  ListaBin = ^NodoBin;
  NodoBin = record
    bin: 0..1;
    sig: ListaBin;
  end;

function calcularNum(lista: ListaBin): Integer;
var
  acum, pot: Integer;
begin
  acum := 0;
  pot := 1;
  while lista <> nil do
  begin
    acum := acum + lista^.bin * pot;
    pot := pot * 2;
    lista := lista^.sig
  end;

  calcularNum := acum
end;

// function Potencia(a: integer; b: Integer): integer;
  // var
  //   resultado, i: Integer;
  // begin
  //   resultado := 1;
  //   for i := 1 to b do
  //     resultado := resultado * a;
  //   Potencia := resultado;
  // end;

// function CalcularNum(lista: ListaBin):integer;
  // var
  //   exp, suma : integer;
  // begin
  //   exp := 0;
  //   suma := 0;
  //   while (lista <> nil) do
  //   begin
  //     // writeln('lista^.bin: ', lista^.bin:2);
  //     suma := suma + (lista^.bin * Potencia(2, exp));
  //     // writeln('Suma: ', suma:2);
  //     // writeln;

  //     lista := lista^.sig;
  //     exp := exp + 1;
  //   end;

  //   CalcularNum := suma;
  // end;


// -------------------------------------------------------- //
  procedure GenerarLista(var L: ListaBin; n: Integer);
  var
    i: Integer;
    nuevo, actual: ListaBin;
  begin
    L := nil;
    for i := 1 to n do
    begin
      new(nuevo);
      nuevo^.bin := Random(2);  // Genera 0 o 1 aleatoriamente
      nuevo^.sig := nil;
      if L = nil then
        L := nuevo
      else
      begin
        actual := L;
        while actual^.sig <> nil do
          actual := actual^.sig;
        actual^.sig := nuevo;
      end;
    end;
  end;

  procedure CrearListaEspecifica(var L: ListaBin; valores: array of Integer);
  var
    i: Integer;
    nuevo, actual: ListaBin;
  begin
    L := nil;
    for i := Low(valores) to High(valores) do
    begin
      new(nuevo);
      nuevo^.bin := valores[i];
      nuevo^.sig := nil;
      if L = nil then
        L := nuevo
      else
      begin
        actual := L;
        while actual^.sig <> nil do
          actual := actual^.sig;
        actual^.sig := nuevo;
      end;
    end;
  end;

  procedure ImprimirLista(L: ListaBin);
  begin
      Write('[');
    while L <> nil do
    begin
      Write(L^.bin:2, ' ');
      L := L^.sig;
    end;
    Writeln(']');
  end;
// -------------------------------------------------------- //

var
  Lista1, Lista2, Lista3: ListaBin;
  res : integer;
begin
  Randomize;
  GenerarLista(Lista1, 5);
  CrearListaEspecifica(Lista2, [0, 1, 0, 1, 1]);
  CrearListaEspecifica(Lista3, [0, 1, 1]);

  // Writeln('Listas Random:');
  // ImprimirLista(Lista1);
  Write('Lista especifica: ');
  ImprimirLista(Lista2);

  res := CalcularNum(Lista2);
  Writeln('El resultado es: ', res:2);

  writeln;
  Write('Lista especifica: ');
  ImprimirLista(Lista3);
  writeln;
  res := CalcularNum(Lista3);
  Writeln('El resultado es: ', res:2);

end.
