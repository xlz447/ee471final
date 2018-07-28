module fwdTest (regIn, old1cc, old2cc, muxCtrl);
	input [4:0] regIn, old1cc, old2cc;
	output reg [1:0] muxCtrl;
	
	always @(*) begin
		if (regIn == 5'b00000)
			 muxCtrl = 2'b00;
		else if (regIn == old1cc)
			 muxCtrl = 2'b10;
		else if (regIn == old2cc)
			 muxCtrl = 2'bx1;
		else 
			 muxCtrl = 2'b00;
	end
endmodule 