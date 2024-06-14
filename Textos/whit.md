whit.md

## ¿Cuándo se usa `WITH`?

Supongamos que tienes un registro `TNerr`:

```pascal
type
  TError = (diverr, reserr, argerr);
  TEstado = (correcto, incorrecto);
  TNerr = record
    case estado: TEstado of
      correcto: (num: integer);
      incorrecto: (err: TError);
  end;
```

Se quiere pasar de:

```pascal
{Sin with}

procedure mostrarResultado(resu: TNerr);
begin
  if resu.estado = incorrecto then
  begin
    case resu.err of
      diverr: writeln('ERROR: No se puede dividir entre cero => b = 0');
      reserr: writeln('ERROR: Resultado negativo => a < b');
      argerr: writeln('ERROR: Alguno de los argumentos no son válidos');
    end;
  end
  else
    writeln('Resultado: ', resu.num:2);
end;
```

a esto:

```pascal
{Con with}

procedure mostrarResultado(resu: TNerr);
begin
  with resu do
  begin
    if estado = incorrecto then
    begin
      case err of
        diverr: writeln('ERROR: No se puede dividir entre cero');
        reserr: writeln('ERROR: Resultado negativo');
        argerr: writeln('ERROR: Argumento inválido');
      end;
    end
    else
      writeln('Resultado: ', num:2);
  end;
end;
```

Usar `with` simplifica el acceso a los campos del registro `resu` al eliminar la necesidad de repetir `resu.` antes de cada campo.
```

Puedes copiar y pegar este contenido en tu archivo Markdown.