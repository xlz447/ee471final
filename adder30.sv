module adder30 (BF, A, B, Y);
	input [29:0] A, B;
	input BF;
	output [29:0] Y;
	wire [29:0]Co;
	wire Ci;
	
	mux2 m1 (BF, 1'b1, 1'b0, Ci);
	addsub1 add0 (A[0], B[0], Ci, Co[0], Y[0]); 
	genvar i;
	generate
		for (i=1; i<30; i++)begin : eachAdd
			addsub1 add (A[i], B[i], Co[i-1], Co[i], Y[i]); 
		end
	endgenerate
	
endmodule 