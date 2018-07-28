module decoder2_4(out, in, en);
	output [3:0] out;
	input [1:0] in;
	input en;
	wire [1:0] notin;
	
	not n0(notin[0], in[0]);
	not n1(notin[1], in[1]);
	and a0(out[3], en, in[1], in[0]);
	and a1(out[2], en, in[1], notin[0]);
	and a2(out[1], en, notin[1], in[0]);
	and a3(out[0], en, notin[1], notin[0]);
endmodule 	

module decoder2_4_testbench();
 reg [1:0] in;
 reg en;
 wire[3:0] out;

 decoder2_4 dut (.out(out), .in(in), .en(en));

 integer i;
 
 initial begin
	for(i=0; i<8; i++) begin
		{en, in[1], in[0]} = i; #10;
	end 
 end
endmodule  	