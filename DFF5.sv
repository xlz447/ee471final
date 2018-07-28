module DFF5 (Din, clk, rst, Dout);
	input [4:0] Din;
	input clk, rst;
	output [4:0] Dout;
	
	genvar i;
	generate
		for (i=0; i<5; i++)begin : eachDFF
			D_FF d (Dout[i], Din[i], rst, clk);
		end
	endgenerate
endmodule 