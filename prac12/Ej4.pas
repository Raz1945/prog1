program prac12Ej4;

type
  ListaInt = ^TCelda;
  TCelda = record
    info: integer;
    sig: ListaInt;
  end;

  Positivo = 1..MaxInt;

{ Procedimiento para imprimir los elementos de una lista enlazada }
procedure imprimir(l: ListaInt);
var
  p: ListaInt;
  esPrimero: boolean;
begin
  p := l;
  esPrimero := true;

  write('Lista: [');
  while (p <> nil) do
  begin
    if not esPrimero then
      write(', ');

    write(p^.info:1);
    esPrimero := false;
    p := p^.sig;
  end;
  write(']');
  writeln;  { Agrega un salto de línea al final }
end;


{ Borra el segundo elemento de la lista. }
procedure borrarSegundo(var l: ListaInt);
var
  temp: ListaInt;
begin
  if (l <> nil) and (l^.sig <> nil) then
  begin
    temp := l^.sig;    { Guardar la referencia al segundo nodo }
    l^.sig := temp^.sig; { El primer nodo ahora apunta al tercero }
    dispose(temp);     { Liberar la memoria del segundo nodo }
  end;
end;


procedure borrarUltimo(var l: ListaInt);
    { La lista está vacía, no hay nada que eliminar. }
var
  temp, current: ListaInt;
begin
  if l^.sig = nil then { Si solo hay un elemento en la lista. }
  begin
    dispose(l);
    l := nil;
  end
  else
  begin
    current := l;
    while current^.sig^.sig <> nil do
      current := current^.sig; { current ahora apunta al penúltimo nodo. }

    temp := current^.sig; { almacena la referencia del último nodo }
    current^.sig := nil;
    dispose(temp);
  end;
end;


{ Borra el primer número impar de la lista. }
procedure borrarElPrimerImpar(var l: ListaInt);
var
  current, prev, temp: ListaInt;
  eliminado: boolean;
begin
  eliminado := false;

  { La lista está vacía, no hay nada que eliminar. }
  if not (l = nil) then
  begin
    prev := l;
    current := l;

    while (current <> nil) and not eliminado do
    begin
      if (current^.info mod 2 <> 0) then { Si el elemento actual es impar. }
      begin
        prev^.sig := current^.sig; { Apunta a la referencia del proximo nodo }
        dispose(current);
        eliminado := true;
      end
      else
      begin
        prev := current;
        current := current^.sig;
      end;
    end;
  end;
end;


{ Programa principal }
var
  item1, item2, item3: ListaInt;

begin
  new(item1);
  item1^.info := 30;

  new(item2);
  item2^.info := 3;
  item1^.sig := item2;

  new(item3);
  item3^.info := 5;
  item2^.sig := item3;
  item3^.sig := nil; { el ultimo nodo apunta a nil }

  imprimir(item1);
  // borrarSegundo(item1);
  // borrarUltimo(item1);
  borrarElPrimerImpar(item1);
  imprimir(item1);
end.
