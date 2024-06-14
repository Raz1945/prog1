program pra3Ej12;
var
  a, b , c, discrim, raiz1, raiz2: real;
begin
  write('Ingrese coeficientes de la ecuacion: ');
  readln(a, b, c);
  discrim := sqr(b) -4*a*c;

  if discrim > 0 then
    begin
      raiz1 := (-b + sqrt(discrim)) / (2 * a);
      raiz2 := (-b - sqrt(discrim)) / (2 * a);
      
      writeln('Discriminante > 0:');
      writeln('x1 = ', raiz1:2:2);
      writeln('x2 = ', raiz2:2:2);
    end
  else if discrim = 0 then
    begin
      raiz1 := -b / (2 * a);

      writeln('Discriminante = 0:');
      writeln('x1 = ', raiz1:2:2);
    end
  else 
    begin
      raiz1 := (-b + sqrt(-discrim)) / (2 * a);
      raiz2 := (-b - sqrt(-discrim)) / (2 * a);
      
      writeln('Discriminante < 0 (raices imaginarias):');
      writeln('x1 = ', raiz1:2:2,'i');
      writeln('x2 = ', raiz2:2:2,'i');
    end
end.

{
  bhaskara = - b +/- ((b^2 - 4ac) /2a )^(1/2)

  discriminante  = (b^2 - 4ac)
    - Si el discriminante es positivo, hay dos raíces reales distintas.
      Ejemplo: (x^2 + 5x + 6 = 0

    - Si el discriminante es cero, existe una única raíz real.
      Ejemplo: (x^2 - 4x = 0)

    - Si el discriminante es negativo, las raíces son números imaginarios.
      Ejemplo: (1x^2 + 4x +5 = 0)

}
