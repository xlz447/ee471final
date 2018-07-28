module mux32x32_32(out, in, s);
 output [31:0] out;
 input reg [31:0] in [31:0];
 input [4:0] s;

 genvar i;
	generate
		 for(i=0; i<32; i++) begin : eachMux
			mux32_1 m(.out(out[i]), .in({in[31][i], in[30][i], in[29][i], in[28][i], in[27][i], in[26][i], in[25][i], in[24][i], in[23][i], in[22][i], in[21][i], 
			in[20][i], in[19][i], in[18][i], in[17][i], in[16][i], in[15][i], in[14][i], in[13][i], in[12][i], in[11][i],
			in[10][i], in[9][i], in[8][i], in[7][i], in[6][i], in[5][i], in[4][i], in[3][i], in[2][i], in[1][i], in[0][i]}), .s(s)) ;
	end
 endgenerate 

endmodule 

module mux32x32_32_testbench();
 reg [31:0] in [31:0];
 reg [4:0] s;
 wire [31:0] out;

 mux32x32_32 dut (.out(out), .in(in), .s(s));

 initial begin
 	 s='b00000; in[0]=5; #10;
	 s='b00000; in[0]=2; #10;
	 s='b00001; in[1]=1; #10;
	 s='b00001; in[1]=2; #10;
	 s='b00001; in[1]=1; #10;
	 s='b00001; in[1]=16; #10;
	 //s='b11111; in[1]=0; #10;
	 //s='b11111; in[1]=2147483648; #10;
 end
endmodule  