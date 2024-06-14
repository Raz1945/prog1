{
  # Problema de la Fuente

  Tengo dos recipientes uno de capacidad de  7L (rec7) y de 5L (rec5)
  Tambien se tiene una uente de donde se pueden llenar infinitamente los recipientes
  Necesito obtener 4L, el problema esta en que los recipientes no tiene reglas de medida,
  simplemente sabemos su capacidad maxima
}

program Fuente;
var 
  rec7, rec5 : integer;

begin
  rec7 := 0; (* Maximo 7L *)
  rec5 := 0; (* Maximo 5L *)

  // Llenamos rec7
  rec7 := 7;
  rec5 := 0;

  // Traspasa de rec7 = 2 a rec5 = 5
  rec5 := rec7 - 5;   

  // Vaciamos rec5 = 0
  rec5 :=0;

  // Traspasa de rec7 a rec5 = 2
  rec5 := rec7;

  // Llenamos rec7 = 7
  rec7 := 7; 

  // Traspasa de rec7 = 7 a rec5 = 2
  rec5 := 5 - 2; 
  rec7 := rec7 - rec5; 

  // reseteamo el valor de rec5
  rec5 := 0;

  writeln('El rec7 finalmente contiene', rec7,'L', rec5,'L');

end.
