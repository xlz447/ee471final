module D_FF (q, d, reset, clk);
	 output reg q;
	 input d, reset, clk;
	 always @(posedge clk)
	 if (reset)
	 q <= 0; // On reset, set to 0
	 else
	 q <= d; // Otherwise out = d
endmodule 

module dtest ();
	reg d, reset, clk;
	wire q;
	D_FF d1 (q, d, reset, clk);
	
	parameter ClockDelay = 5000;
	initial clk = 0;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end
	initial begin
	#(ClockDelay/2); d <= 1;
	#(ClockDelay/2); d <= 0;
	reset <=0;
	#ClockDelay;
	end
endmodule 