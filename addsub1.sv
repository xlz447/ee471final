module addsub1 (A, B, Ci, Co, Y);
	input A, B, Ci;
	output Co, Y;
	wire [2:0]C;
	
	and(C[0], A, B);
	and(C[1], A, Ci);
	and(C[2], B, Ci);
	or(Co, C[0], C[1], C[2]);
	xor(Y, A, B, Ci);
endmodule 