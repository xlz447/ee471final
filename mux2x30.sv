module mux2x30 (S, A, B, Y);
	input [29:0] A, B;
	input S;
	output [29:0]Y;
	
	genvar i;
	generate
		for (i=0; i<30; i++)begin : eachMux2
			mux2 m(S ,A[i], B[i], Y[i]);
		end
	endgenerate
endmodule 