module ALU1 (S, A, B, Ci, Co, Y);
	input A, B, Ci;
	input [1:0] S;
	output Co, Y;
	wire notB, mOut, xOut, asOut;
	
	not n1 (notB, B);
	mux2 m1 (S[1], B, notB, mOut);
	xor x1 (xOut, A, B);
	addsub1 as1 (A, mOut, Ci, Co, asOut);
	mux4_multIn m2 (S, asOut, xOut, asOut, asOut, Y);
endmodule 