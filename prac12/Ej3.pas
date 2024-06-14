program prac12Ej3;

type
  ListaInt = ^TCelda;
  TCelda = record
    info: integer;
    sig: ListaInt;
  end;

  ListaPos = ^TCeldaPos;
  TCeldaPos = record
    pos: integer;
    sig: ListaPos;
  end;

  Positivo = 1..MaxInt;
  PosibleElem = record 
    case ok: boolean of
      true: (elem: integer);
      false: ();
  end;

{ Retorna la suma de todos los elementos de la lista }
function suma(l: ListaInt): integer;
var
  total: integer;
  p: ListaInt;
begin
  total := 0;
  p := l;

  while p <> nil do
  begin
    total := total + p^.info;
    p := p^.sig;
  end;

  suma := total;
end;

{ Retorna el minimo valor de la lista. }
function minimo(l: ListaInt): integer;
{ Supondremos que la lista no está vacía }
var
  temp: integer;
  p: ListaInt;
begin
  p := l;
  temp := p^.info;

  while p <> nil do
  begin
    if p^.info < temp then
      temp := p^.info;
    
    p := p^.sig;
  end;

  minimo := temp;
end;

{ Retorna el producto de todos los elementos de la lista. }
function producto(l: ListaInt): integer;
var
  p: ListaInt;
  r: integer;
begin
  p := l;
  r := 1;

  while p <> nil do
  begin
    r := r * p^.info;
    p := p^.sig;
  end;

  producto := r;
end;

{ Retorna la cantidad de numeros pares dentro de la lista. }
function cuantosPares(l: ListaInt): integer;
var
  p: ListaInt;
  count: integer;
begin
  p := l;
  count := 0;

  while p <> nil do
  begin
    if (p^.info mod 2 = 0) then
      count := count + 1;

    p := p^.sig;
  end;

  cuantosPares := count;
end;

{ Retorna la primera posición en la cual aparece el valor dentro de la lista. }
function posicion(valor: integer; l: ListaInt): integer;
var
  p: ListaInt;
  i: integer;
  encontrado: boolean;
begin
  p := l;
  i := 1;
  encontrado := false;

  posicion := -1;  { Inicializa con -1, por si el valor no se encuentra en la lista }

  while (p <> nil) and not encontrado do
  begin
    if (p^.info = valor) then
    begin
      posicion := i;
      encontrado := true; { Marcar como encontrado para detener el bucle }
    end;

    p := p^.sig;
    i := i + 1;
  end;
end;

{ Retorna una lista con las posiciones en las que se encuentra un número en la lista. }
function posiciones(valor: integer; l: ListaInt): ListaPos;
var
  p: ListaInt;
  i: integer;
  listaPosiciones, nuevaPosicion, ultimaPosicion: ListaPos;
begin
  p := l;
  i := 1;
  listaPosiciones := nil;

  while (p <> nil) do
  begin
    if (p^.info = valor) then
    begin
      new(nuevaPosicion);
      nuevaPosicion^.pos := i;
      nuevaPosicion^.sig := nil;

      if listaPosiciones = nil then
      begin
        listaPosiciones := nuevaPosicion;
        ultimaPosicion := nuevaPosicion;
      end
      else
      begin
        ultimaPosicion^.sig := nuevaPosicion;
        ultimaPosicion := nuevaPosicion;
      end;
    end;

    i := i + 1;
    p := p^.sig;
  end;

  posiciones := listaPosiciones;
end;

{ Imprimir las posiciones encontradas }
procedure imprimirPosiciones(listaPosiciones: ListaPos);
var
  p: ListaPos;
  esPrimero: boolean;
begin
  if listaPosiciones = nil then
  begin
    writeln('No se encontro el valor en la lista.');
  end
  else
  begin
    write('El valor se encuentra en las posiciones: [');

    p := listaPosiciones;
    esPrimero := true;
    while p <> nil do
    begin
      if not esPrimero then
        write(', ');
      write(p^.pos:0);
      esPrimero := false;
      p := p^.sig;
    end;

    writeln(']');
  end;
end;

{ Liberar la memoria de la lista de posiciones }
procedure liberarPosiciones(var listaPosiciones: ListaPos);
var
  p: ListaPos;
begin
  while listaPosiciones <> nil do
  begin
    p := listaPosiciones;
    listaPosiciones := listaPosiciones^.sig;
    dispose(p);
  end;
end;

{ Retorna el valor del elemento de la lista que esta en dicha posicion 'pos' }
procedure elemEnPos(pos: Positivo; l: ListaInt; var resultado: PosibleElem);
var
  p: ListaInt;
  i: integer;
begin
  p := l;
  i := 1;
  resultado.ok := false;  { Inicializa con false, por si no se encuentra la posición }

  while (p <> nil) do
  begin
    if i = pos then
    begin
      resultado.ok := true;
      resultado.elem := p^.info;
    end;

    p := p^.sig;
    i := i + 1;
  end;
end;

{ Retorna el último elemento de la lista. }
function ultimo(l: ListaInt) : integer;
var
  p: ListaInt;
begin
  p := l;

  { Recorre la lista hasta el último elemento }
  while (p^.sig <> nil) do
    p := p^.sig;

  { Devuelve el valor del último elemento }
  ultimo := p^.info;
end;

{ Determina si la lista está ordenada de menor a mayor.}
function ordenada(l: ListaInt): boolean;
var
  p: ListaInt;
  temp: integer;
begin
  if l = nil then
  begin
    ordenada := true;  { Una lista vacía se considera ordenada. }
    exit;
  end;

  p := l;
  temp := p^.info;
  p := p^.sig;
  ordenada := true;  { Inicialmente asumimos que está ordenada. }

  while (p <> nil) do
  begin
    if temp > p^.info then
    begin
      ordenada := false;
    end;
    temp := p^.info;
    p := p^.sig;
  end;
end;


{ Programa Principal }
var
  item1, item2, item3, item4: ListaInt;
  listaPosiciones: ListaPos;
  valor: integer;
  resultado: PosibleElem;

begin
  { Crear y enlazar los nodos de la lista }
  new(item1);
  item1^.info := 2;
  item1^.sig := item2;

  new(item2);
  item2^.info := 4;
  item2^.sig := item3;

  new(item3);
  item3^.info := 6;
  item3^.sig := item4;

  new(item4);
  item4^.info := 6;
  item4^.sig := nil;  { El último nodo apunta a nil }

  writeln('La suma es: ', suma(item1):3);
  writeln('El producto es: ', producto(item1):3);
  writeln('El valor mas chico es: ', minimo(item1):3);
  writeln('Cuantos pares tiene la lista: ', cuantosPares(item1):3);

  writeln;
  
  valor := 1;
  writeln('En que posicion se encuentra el primer valor ',valor:2);
  listaPosiciones := posiciones(valor, item1);
  imprimirPosiciones(listaPosiciones);

  { Probar elemEnPos }
  elemEnPos(valor, item1, resultado);
  if resultado.ok then
    writeln('El elemento en la posicion',valor:2,' es: ', resultado.elem:2)
  else
    writeln('No se encontro la posicion ',valor:2,' en la lista.');

  writeln;
  writeln('El ultimo elemento de la lista es', ultimo(item1):2);

  writeln;
  writeln('La lista se encuentra ordenada?');
  if ordenada(item1) then
    writeln('Esta ordenada!')
  else
    writeln('No lo esta.');


  { Liberar la memoria asignada a la lista de posiciones }
  liberarPosiciones(listaPosiciones);

  { Liberar la memoria asignada a la lista }
  dispose(item1);
  dispose(item2);
  dispose(item3);
  dispose(item4);
end.
