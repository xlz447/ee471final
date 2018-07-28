module mux32_1(out, in, s);
 output out;
 input [31:0] in;
 input [4:0] s;

 wire [3:0] v;

 mux8_1 m0(.out(v[0]), .in(in[7:0]), .s(s[2:0]));
 mux8_1 m1(.out(v[1]), .in(in[15:8]), .s(s[2:0]));
 mux8_1 m2(.out(v[2]), .in(in[23:16]), .s(s[2:0]));
 mux8_1 m3(.out(v[3]), .in(in[31:24]), .s(s[2:0]));
 mux4_1 m(.out(out), .in(v), .s(s[4:3]));
endmodule 

module mux32_1_testbench();
 reg [31:0] in;
 reg [4:0] s;
 wire out;

 mux32_1 dut (.out(out), .in(in), .s(s));

 initial begin
 	 s='b00000; in=1; #10;
	 s='b00000; in=2; #10;
	 s='b00001; in=1; #10;
	 s='b00001; in=2; #10;
	 s='b00100; in=1; #10;
	 s='b00100; in=16; #10;
	 s='b11111; in=0; #10;
	 s='b11111; in=2147483648; #10;
 end
endmodule  