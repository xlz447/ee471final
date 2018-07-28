module DFF32 (Din, clk, rst, Dout);
	input [31:0] Din;
	input clk, rst;
	output [31:0] Dout;
	
	genvar i;
	generate
		for (i=0; i<32; i++)begin : eachDFF
			D_FF d (Dout[i], Din[i], rst, clk);
		end
	endgenerate
endmodule 