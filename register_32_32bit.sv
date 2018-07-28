module register_32_32bit(out, newdata, en, clk);
	output reg [31:0] out [31:0];
	input [31:0] newdata, en;
	input clk;
	
	genvar i;
	generate
		 for(i=1; i<32; i++) begin : eachDff
			register_32bit r(.out(out[i]), .newdata(newdata), .en(en[i]), .clk(clk));
		 end
	endgenerate
	
	assign out[0] = 0;
	
endmodule

module register_32_32bit_testbench;
 reg [31:0] newdata, en;
 reg clk;
 wire [31:0] out [31:0];
 parameter period = 100;
 
 register_32_32bit dut(.out(out), .newdata(newdata), .en(en), .clk(clk)); 

 initial clk = 1;
 always #(period/2) clk = ~clk;
 
 initial begin
	 newdata = 0; en = 0;
	 #period newdata = 32; en = 2;
	 #period newdata = 32; en = 0;
	 #period newdata = 0; en = 2;
	 #period newdata = 0; en = 0;
	 #period newdata = 1; en = 1;
	 #period newdata = 1; en = 0;
	 #period newdata = 32'hA0; en = 2;
	 #period newdata = 32'hA0; en = 0;
	 #period;
	 $stop();
 end
endmodule  