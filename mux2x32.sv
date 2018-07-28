module mux2x32 (S, A, B, Y);
	input [31:0] A, B;
	input S;
	output [31:0]Y;
	
	genvar i;
	generate
		for (i=0; i<32; i++)begin : eachMux2
			mux2 m(S, A[i], B[i], Y[i]);
		end
	endgenerate
endmodule 