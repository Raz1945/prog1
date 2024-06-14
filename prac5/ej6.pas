program prac5Ej6;
var
  letra, letraSiguiente : char;
begin
  write('Ingrese un texto: ');
  read(letra);
  write('Las constantes y vocales duplicadas son: ');
  
  repeat
    read(letraSiguiente);
    
    if (letraSiguiente = letra) then
      case letra of
        'a', 'e', 'i', 'o', 'u': write(' ',letra,letraSiguiente);
      else
        write(letra,letraSiguiente)
      end;

    letra := letraSiguiente;
  until (letra = '$');    
end.