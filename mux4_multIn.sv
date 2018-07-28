module mux4_multIn (S, A, B, C, D, Y);
	input [1:0]S;
	input A, B, C, D;
	output Y;
	wire y0, y1;
	
	mux2 m1(S[0], A, B, y0);
	mux2 m2(S[0], C, D, y1);
	mux2 m3(S[1], y0, y1, Y);
endmodule 