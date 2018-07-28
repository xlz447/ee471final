module register_1bit(out, newdata, en, clk);
 output out;
 input newdata, en, clk;
 reg ps, ns, reset;
 
 mux2_1 m(.out(ns), .in({newdata, ps}), .s(en)); 	
 D_FF dffb(.q(ps), .d(ns), .reset(reset), .clk(clk));
 
 assign reset = 0;
 assign out = ps;
endmodule

module register_1bit_testbench;
 reg newdata, en, clk;
 wire out;
 parameter period = 100;
 
 register_1bit dut(.out(out), .newdata(newdata), .en(en), .clk(clk)); 

 initial clk = 1;
 always #(period/2) clk = ~clk;

 
 initial begin
	 newdata = 0; en= 0;
	 #80 newdata = 1; en = 1;
	 #period newdata = 1; en = 0;
	 #period newdata = 0; en = 1;
	 #period;
	 $stop();
 end
endmodule  