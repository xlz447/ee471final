module SignExtend32(imm16, SEimm16);
	input [15:0] imm16;
	output reg [31:0] SEimm16;
	
	assign SEimm16 [15:0] = imm16 [15:0];
	
	genvar i;
	generate
		for (i=16; i<32; i++)begin : eachBff
			buf b (SEimm16 [i], imm16[15]);
		end
	endgenerate
endmodule 