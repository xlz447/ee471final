module decoder5_32(out, in, en);
	output [31:0] out;
	input [4:0] in;
	input en;
	
	wire [3:0] en2;
	
	decoder2_4 d0(.out(en2), .in(in[4:3]), .en(en));
	decoder3_8 d1(.out(out[7:0]), .in(in[2:0]), .en(en2[0]));
	decoder3_8 d2(.out(out[15:8]), .in(in[2:0]), .en(en2[1]));
	decoder3_8 d3(.out(out[23:16]), .in(in[2:0]), .en(en2[2]));
	decoder3_8 d4(.out(out[31:24]), .in(in[2:0]), .en(en2[3]));
endmodule

module decoder5_32_testbench();
 reg [4:0] in;
 reg en;
 wire[31:0] out;

 decoder5_32 dut (.out(out), .in(in), .en(en));

 integer i;
 
 initial begin
	for(i=0; i<64; i++) begin
		{en, in[4], in[3], in[2], in[1], in[0]} = i; #10;
	end 
 end
endmodule  	