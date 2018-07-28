module PC(newPC, oldPC, rst, clk);
	input [29:0] oldPC;
	input rst, clk;
	output [29:0]newPC;
	
	genvar i;
	generate
		for (i=0; i<30; i++) begin : eachDFF
			D_FF df(newPC[i], oldPC[i], rst, clk);
		end
	endgenerate
endmodule 