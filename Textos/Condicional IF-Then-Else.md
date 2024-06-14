
Para saber a quien corresponde un ELSE se sigue la siguiente regla.

El ELSE corresponde al THEN mas cercano a él siempre y cuando no contenga un ELSE propio.

```C#
IF a > b then
  if a > c then
    max:= a
  else 
    max: c
```



# CASE 
En caso de que no se tenga un 'ELSE' y el numero ingresado no sea ninguno de los 'casos' el programa 
FreePascal con normalidad (no hay error)

```csharp
var mes: integer;
BEGIN
  readln(mes);
  CASE mes of
    1, 3, 5,
    7, 8, 10, 12 : writeln('Mes de 31 dias');
    4, 6, 9, 11 : writeln('Mes de 30 dias');
    2 : writeln('Med de 28 dias') 
  end;
```

Si se tuviera un ELSE, el programa saltaria a este
```csharp
var mes: integer;
BEGIN
  readln(mes);
  CASE mes of
    1, 3, 5,
    7, 8, 10, 12 : writeln('Mes de 31 dias');
    4, 6, 9, 11 : writeln('Mes de 30 dias');
    2 : writeln('Med de 28 dias');
    else
      writeln('Numero no valido');
  end;
```