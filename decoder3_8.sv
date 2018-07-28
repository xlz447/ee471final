module decoder3_8(out, in, en);
	output [7:0] out;
	input [2:0] in;
	input en;
	wire [2:0] notin;
	
	not n0(notin[2], in[2]);
	not n1(notin[1], in[1]);
	not n2(notin[0], in[0]);
	
	and a0(out[7], en, in[2], in[1], in[0]);
	and a1(out[6], en, in[2], in[1], notin[0]);
	and a2(out[5], en, in[2], notin[1], in[0]);
	and a3(out[4], en, in[2], notin[1], notin[0]);
	and a4(out[3], en, notin[2], in[1], in[0]);
	and a5(out[2], en, notin[2], in[1], notin[0]);
	and a6(out[1], en, notin[2], notin[1], in[0]);
	and a7(out[0], en, notin[2], notin[1], notin[0]);

endmodule 	

module decoder3_8_testbench();
 reg [2:0] in;
 reg en;
 wire[7:0] out;

 decoder3_8 dut (.out(out), .in(in), .en(en));

 integer i;
 
 initial begin
	for(i=0; i<16; i++) begin
		{en, in[2], in[1], in[0]} = i; #10;
	end 
 end
endmodule  		