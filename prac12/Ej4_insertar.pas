type
  ListaInt = ^TCelda;
  TCelda = record
    info: integer;
    sig: ListaInt;
  end;

  Positivo = 1..MaxInt;



{ Insertar un elemento luego del segundo elemento de la lista. 
Si no hubiera segundo, la lista no cambia. }
procedure insertarTercero(elem: integer; var l: ListaInt);
var
  p, nuevo : ListaInt;
begin
  p := l;

  { Verifica que la lista no este vacia, y que hay al menos un segundo elemento. }
  if (p <> nil) and (p^.sig <> nil) then
  begin
    p := p^.sig; { avanza al segundo elemento. }

    { Crea el nuevo nodo }
    new(nuevo);
    nuevo^.info := elem;
    nuevo^.sig := p^.sig;

    { Insertar el nuevo nodo después del segundo }
    p^.sig := nuevo;
  end;

end;

{ Inserta un elemento antes del último nodo de la lista }
procedure insertarPenultimo(elem: integer; var l: ListaInt);
var
  p, nuevo: ListaInt;
begin
  if (l = nil) or (l^.sig = nil) then
  begin
    writeln('La lista es demasiado corta para insertar un penúltimo elemento.');
    exit;
  end;

  p := l;

  {Si el siguiente elemento del siguiente es el nulo }
  while (p^.sig^.sig <> nil) do
  begin
    p := p^.sig; { avanzar hasta el penúltimo nodo }
  end;

  { p ahora apunta al penúltimo nodo }
  new(nuevo);
  nuevo^.info := elem;
  nuevo^.sig := p^.sig; { nuevo apunta al último nodo }
  p^.sig := nuevo; { el penúltimo nodo apunta al nuevo nodo }
end;

{ Inserta un elemento nuevo luego de la posicion (o nodo) indicada.}
procedure insertarLuegoPos(elem: integer; pos: Positivo; var l: ListaInt);
var
  p, nuevo: ListaInt;
  i: Positivo;
begin
  p := l;
  i := 1;

  // Recorre la lista hasta encontrar la posición deseada
  while (p <> nil) do
  begin
    if i = pos then
    begin
      // Crear un nuevo nodo
      new(nuevo);
      nuevo^.info := elem;
      nuevo^.sig := p^.sig; { nuevo apunta al nodo siguiente }

      // Insertar el nuevo nodo después del nodo actual
      p^.sig := nuevo;

      // Avanzar p a la nueva posición (nuevo nodo insertado)
      p := nuevo^.sig;
    end
    else
    begin
      // Avanzar al siguiente nodo solo si no se ha insertado
      p := p^.sig;
    end;

    i := i + 1;
  end;
end;

{ Insertar un elemento antes de la primera aparición del elemento valor. }
procedure insertarAntes(elem, valor: integer; var l: ListaInt);
var
  p, nuevo: ListaInt;
begin
  p := l;

  // Manejo del caso especial: si el primer elemento es igual al valor
  if (p <> nil) and (p^.info = valor) then
  begin
    new(nuevo);
    nuevo^.info := elem;
    nuevo^.sig := p;
    l := nuevo; // Actualizamos el inicio de la lista
  end
  else
  begin
    // Buscamos el valor en la lista
    while (p <> nil) and (p^.sig <> nil) and (p^.sig^.info <> valor) do
      p := p^.sig;

    // Si encontramos el valor, insertamos el nuevo elemento antes
    if (p <> nil) and (p^.sig <> nil) then
    begin
      new(nuevo);
      nuevo^.info := elem;
      nuevo^.sig := p^.sig;
      p^.sig := nuevo;
    end;
  end;
end;

{ Insertar un elemento en una lista ordenada, manteniendo al final el orden de esta. }
procedure insertarOrdenando(elem: integer; var l: ListaInt);
var
  p, nuevo: ListaInt;
begin
  new(nuevo);
  nuevo^.info := elem;

  if (l = nil) or (l^.info >= elem) then
  begin
    nuevo^.sig := l;
    l := nuevo;
  end
  else
  begin
    p := l;
    while (p^.sig <> nil) and (p^.sig^.info < elem) do
    begin
      p := p^.sig;
    end;

    nuevo^.sig := p^.sig;
    p^.sig := nuevo;
  end;
end;
