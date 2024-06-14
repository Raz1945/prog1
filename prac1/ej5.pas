program Ejercicio5;
var
	valor : real;
begin
	valor := 6 div 2 - 6 mod 5;
	writeln ('I - el valor es:', valor);

	valor := 14 mod 2 * 6 + 3;
	writeln ('II - el valor es:', valor);

	valor := 3 + 14 mod (2 * 3);
	writeln ('III - el valor es:', valor);

	valor := 3.2 + 14 mod (2 * 3);
	writeln ('IV - el valor es:', valor);

	valor := 5 mod 8 + 8 mod 5; 
	writeln ('V - el valor es:', valor);

	valor := 7 mod 2 + 13 div 3 - 2.5; 
	writeln ('VI - el valor es:', valor);
	
	valor := 6 - 2 mod (1+4) + 5; 
	writeln ('VII - el valor es:', valor);
	
	valor := 6 - 2.1 * 3 + 1; 
	writeln ('VIII - el valor es:', valor);

	valor := 7 mod 2; 
	writeln ('VIII - el valor es:', valor);

end.