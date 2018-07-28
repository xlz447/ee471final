module DFF16 (Din, clk, rst, Dout);
	input [15:0] Din;
	input clk, rst;
	output [15:0] Dout;
	
	genvar i;
	generate
		for (i=0; i<16; i++)begin : eachDFF
			D_FF d (Dout[i], Din[i], rst, clk);
		end
	endgenerate
endmodule 