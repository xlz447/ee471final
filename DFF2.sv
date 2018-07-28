module DFF2 (Din, clk, rst, Dout);
	input [1:0] Din;
	input clk, rst;
	output [1:0] Dout;
	
	genvar i;
	generate
		for (i=0; i<2; i++)begin : eachDFF
			D_FF d (Dout[i], Din[i], rst, clk);
		end
	endgenerate
endmodule 