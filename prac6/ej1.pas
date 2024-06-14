program prac6Ej1;
var
  m, n, resultado : integer;

function getMCD(m, n : integer):integer;
var
  k: integer;
begin
  while (m MOD n <> 0) do
  begin
    k := m MOD n;
    m := n;
    n := k;
    // writeln(' k:',k:2);
  end;
  getMCD := k;
end;

Begin
  write('Ingrese m y n :');
  read(m);
  read(n);

  if m > n then
    resultado := getMCD(m,n)
  else
    resultado := getMCD(n,m);

  writeln('El MDC es: ', resultado:2);
End.