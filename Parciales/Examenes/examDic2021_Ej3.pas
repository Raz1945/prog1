procedure borrarPrimNegL(var l: Lista);
var
  p, q: Lista;
begin
  // Verificar si la lista no está vacía
  if l <> nil then
  begin
    // Verificar si el primer elemento de la lista es negativo
    if l^.elem < 0 then
    begin
      // Si el primer elemento es negativo, eliminarlo y ajustar el puntero l
      q := l;
      l := l^.sig;
      dispose(q);
    end
    else
    begin
      // Inicializar el puntero p para recorrer la lista
      p := l;
      // Recorrer la lista hasta encontrar el primer elemento negativo o llegar al final
      while (p^.sig <> nil) and (p^.sig^.elem >= 0) do
        p := p^.sig;
        
      // Si se encuentra un elemento negativo, eliminarlo
      if p^.sig <> nil then
      begin
        q := p^.sig;
        p^.sig := q^.sig;
        dispose(q);
      end;
    end;
  end;
end;
