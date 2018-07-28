module regfile(WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk, ReadData1, ReadData2);
	output [31:0] ReadData1, ReadData2;
	input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input [31:0] WriteData;
	input RegWrite, clk;
	
	wire [31:0] DecToReg;
	wire [31:0] AllData [31:0];
	
	decoder5_32 dec(.out(DecToReg), .in(WriteRegister), .en(RegWrite));
	register_32_32bit r(.out(AllData), .newdata(WriteData), .en(DecToReg), .clk(clk));
	mux32x32_32 m0(.out(ReadData1), .in(AllData), .s(ReadRegister1));
	mux32x32_32 m1(.out(ReadData2), .in(AllData), .s(ReadRegister2));
	
endmodule

// Test bench for Register file 
module regfile_testbench(); 		
	`timescale 1 ps / 100 fs
	parameter ClockDelay = 5000;

	reg [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite, clk;
	wire [31:0] ReadData1, ReadData2;

	integer i;

	// Your register file MUST be named "regfile".
	// Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	regfile reg1(.ReadData1, .ReadData2, .WriteData, 
			  .ReadRegister1, .ReadRegister2, .WriteRegister,
			  .RegWrite, .clk);

	initial clk = 0;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end

	initial begin
		// Try to write the value 0xA0 into register 0.
		// Register 0 should always be at the value of 0.
		RegWrite <= 0;
		ReadRegister1 <= 0;
		ReadRegister2 <= 0;
		WriteRegister <= 0;
		WriteData <= 32'hA0;				@(posedge clk);
		RegWrite <= 1;					@(posedge clk);

		// Write a value into each  register.
		for (i=1; i<32; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i*32'h01020408;	@(posedge clk);
			RegWrite <= 1;				@(posedge clk);
		end

		// Go back and verify that the registers
		// retained the data.
		for (i=0; i<32; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i*32'h100+i;		@(posedge clk);
		end
		$stop;
	end
endmodule