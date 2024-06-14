program Ejercicio6;
var
	acosto, bcosto, ccosto,dcosto, num:real;
begin
	acosto := 4;
	bcosto := 1;
	ccosto := -2;
	dcosto := 5.5;

	num := sqrt(16);
	writeln('I-', round(num));
	
	num := trunc (-13.8);
	writeln('II-', round(num));
	
	num := round (10.7);
	writeln('III-', round(num));
	
	num := sqr(5);
	writeln('IV-', round(num));
		
	num := round(-3.5);
	writeln('V-', round(num));
	
	num := abs(-12);
	writeln('VI-', round(num));
	
	num := trunc(10.1);
	writeln('VII-', round(num));
			
	num := trunc (8.6) - round(8.6);
	writeln('VIII-', round(num));
			
	num := sqrt (acosto / bcosto - ccosto + dcosto - 2.5);
	writeln('IX-', round(num));
			
	num := trunc (dcosto) * abs (ccosto * ( bcosto / acosto));
	writeln('X-', round(num));

end.
