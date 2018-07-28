module mux4_1(out, in, s);
 output out;
 input [3:0] in;
 input [1:0] s;

 wire [1:0] v;

 mux2_1 m0(.out(v[0]), .in(in[1:0]), .s(s[0]));
 mux2_1 m1(.out(v[1]), .in(in[3:2]), .s(s[0]));
 mux2_1 m (.out(out), .in(v), .s(s[1]));
endmodule

module mux4_1_testbench();
 reg [3:0] in;
 reg [1:0] s;
 wire out;

 mux4_1 dut (.out(out), .in(in), .s(s));
 
 integer i;

 initial begin
	for(i=0; i<64; i++) begin
		{s[1], s[0], in[0], in[1], in[2], in[3]} = i; #10;
	end 
 end
endmodule   