module mux2 (S, d0, d1, Y);
	input d0, d1;
	input S; 
	output Y; 
	//Invert the sel signals 
	wire notS, y0,y1;
	not (notS, S); 
	// 2-input SND gate 
	and (y0, d0, notS); 
	and (y1, d1, S); 
	// 2-input OR gate 
	or (Y, y0, y1); 
endmodule 