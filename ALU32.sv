module ALU32 (S, A, B, Z, NG, OF, C, Y);
	input [31:0] A, B;
	input [1:0] S;
	output [31:0] Y;
	output Z, NG, OF, C;
	wire [31:0] Co, t;
	wire slt;

	ALU1 ALU (S, A[0], B[0], S[1], Co[0], t[0]);
	genvar i;
	generate
		for(i=1; i<32; i++) begin : eachALU1
			ALU1 ALUi(S, A[i], B[i], Co[i-1], Co[i], t[i]);
		end
	endgenerate
	
	xor x2 (slt, NG, OF);
	zero z1 (Y, Z);
	and a1 (NG, t[31], 1'b1);
	xor x1 (OF, Co[31], Co[30]);
	and a2 (C, Co[31], 1'b1);
	
	mux4_multIn m1 (S, t[0], t[0], t[0], slt, Y[0]);
	generate
		for(i=1; i<32; i++) begin : eachMux4
			mux4_multIn m(S, t[i], t[i], t[i], 1'b0, Y[i]);
		end
	endgenerate
	
endmodule 

// Test bench for ALU file
//`timescale 1 ps / 100 fs

//module ALUStimulus();
//
//	parameter ClockDelay = 100000;
//
//	reg [31:0] BussA, BussB;
//	reg [1:0] ALUControl;
//
//	wire [31:0] Output;
//	wire zero, overflow, CarryOut, negative;
//
//	integer i;
//
//	// If your register file module is not named "alu" then you will
//	// have to change the following line in order to create an instance of
//	// your register file.  Also you must make sure that the port declarations
//	// match up with the module instance in this stimulus file.
//	ALU32 alu1 (ALUControl, BussA, BussB, zero, negative, overflow, CarryOut, Output);
//
//	initial begin
//
//		/* Addition unit testing */
//		ALUControl=00; 
//		BussA=32'h00000DEF; BussB=32'h00000ABC; #(ClockDelay); // Should output 000018AB
//		BussA=32'h00001234; BussB=32'h00000105; #(ClockDelay); // Should output 00001339
//		BussA=32'h7FFFFFFF; BussB=32'h00000001; #(ClockDelay); // Should output 80000000, overflow, negative
//		
//		ALUControl=01; 
//		BussA=32'h00000DEF; BussB=32'h00000ABC; #(ClockDelay); // 
//		BussA=32'h00001234; BussB=32'h00000105; #(ClockDelay); //
//		BussA=32'h7FFFFFFF; BussB=32'h00000001; #(ClockDelay); // 
//		
//		ALUControl=10; 
//		BussA=32'h00000DEF; BussB=32'h00000ABC; #(ClockDelay); // 
//		BussA=32'h00001234; BussB=32'h00000105; #(ClockDelay); // 
//		BussA=32'h7FFFFFFF; BussB=32'h00000001; #(ClockDelay); // 
//		
//		ALUControl=11; 
//		BussA=32'h00000DEF; BussB=32'h00000ABC; #(ClockDelay); //
//		BussA=32'h00001234; BussB=32'h00000105; #(ClockDelay); // 
//		BussA=32'h7FFFFFFF; BussB=32'h00000001; #(ClockDelay); // 
//		
//		/* Subtraction unit testing */
//		ALUControl=00; 
//		BussA=32'h00000DEF; BussB=32'h00000ABC; #(ClockDelay); // 
//		BussA=32'h00001234; BussB=32'h00000105; #(ClockDelay); // 
//		BussA=32'h80000000; BussB=32'h00000001; #(ClockDelay); // 
//		
//		ALUControl=01; 
//		BussA=32'h00000DEF; BussB=32'h00000ABC; #(ClockDelay); // 	
//		BussA=32'h00001234; BussB=32'h00000105; #(ClockDelay); // 
//		BussA=32'h80000000; BussB=32'h00000001; #(ClockDelay); // 
//		
//		ALUControl=10; 
//		BussA=32'h00000DEF; BussB=32'h00000ABC; #(ClockDelay); // Should output 00000333	
//		BussA=32'h00001234; BussB=32'h00000105; #(ClockDelay); // Should output 0000112F
//		BussA=32'h80000000; BussB=32'h00000001; #(ClockDelay); // Should output 7FFFFFFF, overflow
//
//		ALUControl=11; 
//		BussA=32'h00000DEF; BussB=32'h00000ABC; #(ClockDelay); // 
//		BussA=32'h00001234; BussB=32'h00000105; #(ClockDelay); // 
//		BussA=32'h80000000; BussB=32'h00000001; #(ClockDelay); // 
//		/* You should test your units EXTENSIVELY here.  We just gave a few ideas
//         above to get you started.  Make sure you've checked all outputs for all
//         "interesting" cases. */
//
//	end
//endmodule 
