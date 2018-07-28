module CPU (clk, rst);
	input clk, rst;
	wire [4:0] Rs, Rt, Rd, WrtDstToStage2, WrtDstFromStage2, WrtDstFromStage3, WrtDstFromStage4;
	wire RegDst, ALUSrc, MemToRegToStage2, MemToRegFromStage2, MemToRegFromStage3, RegWrToStage2, RegWrFromStage2, RegWrFromStage3, 
	RegWrFromStage4, MemWrToStage2, MemWrFromStage2, MemWrFromStage3, BranchToStage1, BranchFromStage1, Jump, JumpRs, noRs, noRt, Zero;
	wire [1:0] ALUctrlToStage2, ALUctrlFromStage2;
	wire [31:0] DataA, DataB, SEimm32, DataAToStage2, DataAFromStage2, DataBToStage2, DataBFromStage2, DataBFromStage3, ALUOutToStage3, ALUOutFromStage3, 
	ALUDataBToStage2, ALUDataBFromStage2, dataMemOut, dataWriteToStage4, dataWriteFromStage4, InstToStage1, InstFromStage1, fwdRsTemp, fwdRtTemp;
	wire [15:0] Imm16FromStage1, imm16;
	wire [25:0] targetInst;
	wire Negative, Overflow, Carryout, Zerono; //didnt use
	
	//stage 1----------------------------------------------------------------------------------------------------------------------------------------------
	IFU ifu (DataAToStage2[31:2], targetInst, Imm16FromStage1, BranchFromStage1, Jump, JumpRs, Zero, rst, clk, InstToStage1);
	comparator6 cp6 (InstToStage1[31:26], 6'b000101, BranchToStage1);//accelerated branches, flag
	
	DFF32 stage1InstDFF32 (InstToStage1, clk, rst, InstFromStage1);
	DFF16 stage1Imm16DFF16 (InstToStage1[15:0], clk, rst, Imm16FromStage1);
	D_FF stage1BranchDFF (BranchFromStage1, BranchToStage1, rst, clk);
	//-----------------------------------------------------------------------------------------------------------------------------------------------------
	
	//stage 2/5--------------------------------------------------------------------------------------------------------------------------------------------
	mux2x5 RegDstMux (RegDst, Rt, Rd,  WrtDstToStage2);
	regfile rf (dataWriteFromStage4, Rs, Rt, WrtDstFromStage4, RegWrFromStage4, ~clk, DataA, DataB); //--------special case
	control c (InstFromStage1, RegDst, ALUSrc, MemToRegToStage2, RegWrToStage2, MemWrToStage2, Jump, JumpRs, 
	ALUctrlToStage2, Rs, Rt, Rd, imm16, targetInst, noRs, noRt);
	SignExtend32 se(imm16, SEimm32);
	mux2x32 ALUSrcMux (ALUSrc, DataBToStage2, SEimm32, ALUDataBToStage2);

	//forwarding-------------------------------------------------------------------------------------------------------------------------------------------
	forwarding fwd (DataA, DataB, ALUOutToStage3, dataWriteToStage4, Rs, Rt, WrtDstFromStage2, WrtDstFromStage3, noRs, noRt, DataAToStage2, DataBToStage2);
	//-----------------------------------------------------------------------------------------------------------------------------------------------------
	//accelerated branches---------------------------------------------------------------------------------------------------------------------------------
	comparator32 cp32 (DataAToStage2, DataBToStage2, Zero);
	//-----------------------------------------------------------------------------------------------------------------------------------------------------
	
	DFF32 stage2DataADFF32 (DataAToStage2, clk, rst, DataAFromStage2);
	DFF32 stage2DataBDFF32 (DataBToStage2, clk, rst, DataBFromStage2);
	DFF32 stage2ALUDataBDFF32 (ALUDataBToStage2, clk, rst, ALUDataBFromStage2);
	DFF5 stage2WriteDstDFF5 (WrtDstToStage2, clk, rst, WrtDstFromStage2);
	DFF2 stage2ALUctrlDFF2(ALUctrlToStage2, clk, rst, ALUctrlFromStage2);
	D_FF stage2MemToRegDFF (MemToRegFromStage2, MemToRegToStage2, rst, clk);
	D_FF stage2RegWrDFF (RegWrFromStage2, RegWrToStage2, rst, clk);
	D_FF stage2MemWrDFF (MemWrFromStage2, MemWrToStage2, rst, clk);
	//-----------------------------------------------------------------------------------------------------------------------------------------------------
	
	//stage 3----------------------------------------------------------------------------------------------------------------------------------------------
	ALU32 alu (ALUctrlFromStage2, DataAFromStage2, ALUDataBFromStage2, Zerono, Negative, Overflow, Carryout, ALUOutToStage3);
	
	DFF32 stage3ALUOutDFF32 (ALUOutToStage3, clk, rst, ALUOutFromStage3);
	DFF32 stage3DataBDFF32 (DataBFromStage2, clk, rst, DataBFromStage3);
	DFF5 stage3WriteDstDFF5 (WrtDstFromStage2, clk, rst, WrtDstFromStage3);
	D_FF stage3MemToRegDFF (MemToRegFromStage3, MemToRegFromStage2, rst, clk);
	D_FF stage3MemWrDFF (MemWrFromStage3, MemWrFromStage2, rst, clk);
	D_FF stage3RegWrDFF (RegWrFromStage3, RegWrFromStage2, rst, clk);
	//-----------------------------------------------------------------------------------------------------------------------------------------------------
	
	//stage 4----------------------------------------------------------------------------------------------------------------------------------------------
	dataMem dm (dataMemOut, ALUOutFromStage3, DataBFromStage3, MemWrFromStage3, clk);
	mux2x32 MemToRegMux (MemToRegFromStage3, ALUOutFromStage3, dataMemOut, dataWriteToStage4);
	
	DFF32 stage4dataWriteDFF32 (dataWriteToStage4, clk, rst, dataWriteFromStage4);
	DFF5 stage4WriteDstDFF5 (WrtDstFromStage3, clk, rst, WrtDstFromStage4);
	D_FF stage4RegWrDFF (RegWrFromStage4, RegWrFromStage3, rst, clk);
   //-----------------------------------------------------------------------------------------------------------------------------------------------------
endmodule 

module cpu_tb();
	reg clk, rst;
	
	parameter ClockDelay = 1000;
	initial clk = 1;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end
	
	CPU cpu(clk, rst);
	
	initial begin
		rst = 1;
		#(ClockDelay/100) rst= 0;
		#(800*ClockDelay);
		$stop();
	end
endmodule 