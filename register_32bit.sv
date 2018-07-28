module register_32bit(out, newdata, en, clk);
	output [31:0] out;
	input [31:0] newdata;
	input en, clk;
	
	genvar i;
	generate
		 for(i=0; i<32; i++) begin : eachDff
			register_1bit r(.out(out[i]), .newdata(newdata[i]), .en(en), .clk(clk));
	end
 endgenerate 
endmodule

module register_32bit_testbench;
 reg [31:0] newdata;
 reg en, clk;
 wire [31:0] out;
 parameter period = 100;
 
 register_32bit dut(.out(out), .newdata(newdata), .en(en), .clk(clk)); 

 initial clk = 1;
 always #(period/2) clk = ~clk;
 
 initial begin
	 newdata = 0; en= 0;
	 #(period/2) newdata = 32; en = 1;
	 #period newdata = 1; en = 0;
	 #period newdata = 1; en = 1;
	 #period newdata = 0; en = 1;
	 #period;
	 $stop();
 end
endmodule  