module comparator6 (A, B, Y);
	input [5:0] A, B;
	wire [5:0] temp;
	output Y;
	
	genvar i;
	generate
		for (i=0; i<6; i++)begin : eachXor
			xor x(temp[i], A[i], B[i]);
		end
	endgenerate
	
	nor n(Y, temp[0], temp[1], temp[2], temp[3], temp[4], temp[5]);
endmodule 