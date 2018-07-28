module mux2_1(out, in, s);
 output out;
 input [1:0] in;
 input s;
 wire v0, v1, nots;
 
 not n0(nots, s);
 and a0(v1, in[1], s);
 and a1(v0, in[0], nots);
 or o0(out, v1, v0);

endmodule

module mux2_1_testbench();
 reg [1:0] in;
 reg s;
 wire out;

 mux2_1 dut (.out(out), .in(in), .s(s));

 initial begin
	 s=0; in[0]=0; in[1]=0; #10;
	 s=0; in[0]=0; in[1]=1; #10;
	 s=0; in[0]=1; in[1]=0; #10;
	 s=0; in[0]=1; in[1]=1; #10;
	 s=1; in[0]=0; in[1]=0; #10;
	 s=1; in[0]=0; in[1]=1; #10;
	 s=1; in[0]=1; in[1]=0; #10;
	 s=1; in[0]=1; in[1]=1; #10;
 end
endmodule  