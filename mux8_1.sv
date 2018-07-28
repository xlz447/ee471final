module mux8_1(out, in, s);
 output out;
 input [7:0] in;
 input [2:0] s;

 wire [1:0] v;

 mux4_1 m0(.out(v[0]), .in(in[3:0]), .s(s[1:0]));
 mux4_1 m1(.out(v[1]), .in(in[7:4]), .s(s[1:0]));
 mux2_1 m (.out(out), .in(v), .s(s[2]));
endmodule

module mux8_1_testbench();
 reg [7:0] in;
 reg [2:0] s;
 wire out;

 mux8_1 dut (.out(out), .in(in), .s(s));
 
 integer i;

 initial begin
	for(i=0; i<2048; i++) begin
		{s[2], s[1], s[0], in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]} = i; #10;
	end 
 end
endmodule
