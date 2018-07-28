module SignExtend30(imm16, SEimm16);
	input [15:0] imm16;
	output reg [29:0] SEimm16;
	
	assign SEimm16 [15:0] = imm16 [15:0];
	
	genvar i;
	generate
		for (i=16; i<30; i++)begin : eachBff
			buf b (SEimm16 [i], imm16[15]);
		end
	endgenerate
endmodule 