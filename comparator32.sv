module comparator32 (D1, D2, Z);
	input [31:0] D1 ,D2;
	output Z;
	wire [7:0] x;
	wire [1:0] y;
	wire [31:0] A;
	
	genvar i;
	generate
		for (i=0; i<32; i++)begin : eachXor
			xor x(A[i], D1[i], D2[i]);
		end
	endgenerate
	
	nor (x[0], A[0], A[1], A[2], A[3]);
	nor (x[1], A[4], A[5], A[6], A[7]);
	nor (x[2], A[8], A[9], A[10], A[11]);
	nor (x[3], A[12], A[13], A[14], A[15]);
	
	nor (x[4], A[16], A[17], A[18], A[19]);
	nor (x[5], A[20], A[21], A[22], A[23]);
	nor (x[6], A[24], A[25], A[26], A[27]);
	nor (x[7], A[28], A[29], A[30], A[31]);
	
	and (y[0], x[0], x[1], x[2], x[3]);
	and (y[1], x[4], x[5], x[6], x[7]);
	
	and (Z, y[0], y[1]);
	
endmodule 