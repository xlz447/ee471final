module mux2x5 (S, A, B, Y);
	input [4:0] A, B;
	input S;
	output [4:0]Y;
	
	genvar i;
	generate
		for (i=0; i<5; i++)begin : eachMux2
			mux2 m(S, A[i], B[i], Y[i]);
		end
	endgenerate
endmodule 