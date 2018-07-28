module IFU (JumpAddr, targetInst, imm16, Branch, Jump, JumpRs, Zero, rst, clk, Instructions);
	input Branch, Jump, JumpRs, Zero, rst, clk;
	input [29:0] JumpAddr;
	input [25:0] targetInst;
	input [15:0] imm16;
	output [31:0] Instructions;
	wire BranchFlag, notZero;
	wire [29:0] AdderSrcB, adderOut, PCout, PCin, SEimm30, concatOut, whichJump;
	
	SignExtend30 se (imm16, SEimm30);
	not n1 (notZero, Zero);
	and a1 (BranchFlag, Branch, notZero);
	mux2x30 branchMux (BranchFlag, 30'b0, SEimm30, AdderSrcB);
	adder30 add30 (BranchFlag, PCout, AdderSrcB, adderOut);
	assign concatOut = {PCout[29:26], targetInst[25:0]};
	mux2x30 jumpMux (Jump, adderOut, concatOut, whichJump);
	mux2x30 jumpRsMux (JumpRs, whichJump, JumpAddr, PCin);
	PC pc (PCout, PCin, rst, clk);
	InstructionMem instMem (Instructions, {PCout, 2'b0});
endmodule 
