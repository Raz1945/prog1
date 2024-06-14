type
  ListaInt = ^TCelda;
  TCelda = record
    info: integer;
    sig: ListaInt;
  end;

{ Ordena una lista de manera ascendente utilizando el método Bubble Sort }
procedure ordenarLista(var l: ListaInt);
var
  current, next: ListaInt;
  temp: integer;
  sorted: boolean;
begin
  if (l = nil) or (l^.sig = nil) then
    exit;  { Si la lista está vacía o tiene un solo elemento, ya está ordenada. }

  repeat
    sorted := true;
    current := l;

    while current^.sig <> nil do
    begin
      next := current^.sig;
      if current^.info > next^.info then
      begin
        { Intercambia los valores }
        temp := current^.info;
        current^.info := next^.info;
        next^.info := temp;
        sorted := false;
      end;
      current := current^.sig;
    end;
  until sorted;
end;
