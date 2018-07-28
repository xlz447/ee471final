module control (Instructions, RegDst, ALUSrc, MemToReg, RegWr, MemWr, /*Branch,*/ Jump, JumpRs, ALUcntrl, Rs, Rt, Rd, imm16, targetInst, noRs, noRt);
	input [31:0] Instructions;
	output reg RegDst, ALUSrc, MemToReg, RegWr, MemWr, /*Branch,*/ Jump, JumpRs, noRs, noRt;
	output reg [1:0] ALUcntrl;
	output reg [4:0] Rs, Rt, Rd;
	output reg [15:0] imm16;
	output reg [25:0] targetInst;
	wire [5:0] Op, Func; 
	
	assign Op = Instructions[31:26];
	assign Func = Instructions[5:0];
	assign Rs = Instructions[25:21];
	assign Rt = Instructions[20:16];
	assign Rd = Instructions[15:11];
	assign imm16 = Instructions[15:0];
	assign targetInst = Instructions[25:0];

	always @(Op or Func) 
			case (Op)
				6'b000000: if (Func == 6'b100000) //add
									begin
										RegDst = 1;
										ALUSrc = 0;
										MemToReg = 0;
										RegWr = 1;
										MemWr = 0;
										Jump = 0;
										JumpRs = 0;
										ALUcntrl = 2'b00;
										noRs = 0;
										noRt = 0;
									end
								else if (Func == 6'b100010) //sub
									begin
										RegDst = 1;
										ALUSrc = 0;
										MemToReg = 0;
										RegWr = 1;
										MemWr = 0;
										Jump = 0;
										JumpRs = 0;
										ALUcntrl = 2'b10;
										noRs = 0;
										noRt = 0;
									end
								else if (Func == 6'b001000) //jr
									begin
										RegDst = 1'bx;
										ALUSrc = 1'bx;
										MemToReg = 1'bx;
										RegWr = 0;
										MemWr = 0;
										Jump = 0;
										JumpRs = 1;
										ALUcntrl = 2'bxx;
										noRs = 0;
										noRt = 1;
									end
								else if (Func == 6'b101010) //slt
									begin
										RegDst = 1;
										ALUSrc = 0;
										MemToReg = 0;
										RegWr = 1;
										MemWr = 0;
										Jump = 0;
										JumpRs = 0;
										ALUcntrl = 2'b11;
										noRs = 0;
										noRt = 0;
									end
								else if (Func == 6'b000000) //initial case
									begin
										RegDst = 0;
										ALUSrc = 0;
										MemToReg = 0;
										RegWr = 0;
										MemWr = 0;
										Jump = 0;
										JumpRs = 0;
										ALUcntrl = 2'bxx;
										noRs = 0;
										noRt = 0;
									end
					6'b100011:  begin  	//lw
										RegDst = 0;
										ALUSrc = 1;
										MemToReg = 1;
										RegWr = 1;
										MemWr = 0;
										Jump = 0;
										JumpRs = 0;
										ALUcntrl = 2'b00;
										noRs = 0;
										noRt = 1;
									end
					6'b101011:  begin  	//sw
										RegDst = 1'bx;
										ALUSrc = 1;
										MemToReg = 1'bx;
										RegWr = 0;
										MemWr = 1;
										Jump = 0;
										JumpRs = 0;
										ALUcntrl = 2'b00;
										noRs = 0;
										noRt = 0;
									end
					6'b000101:  begin  	//bne
										RegDst = 1'bx;
										ALUSrc = 0;
										MemToReg = 1'bx;
										RegWr = 0;
										MemWr = 0;
										Jump = 0;
										JumpRs = 0;
										ALUcntrl = 2'b10;
										noRs = 0;
										noRt = 0;
									end
					6'b000010:  begin  	//j
										RegDst = 1'bx;
										ALUSrc = 1'bx;
										MemToReg = 1'bx;
										RegWr = 0;
										MemWr = 0;
										Jump = 1;
										JumpRs = 0;
										ALUcntrl = 2'bxx;
										noRs = 1;
										noRt = 1;
									end
					6'b001110:  begin  	//xori
										RegDst = 0;
										ALUSrc = 1;
										MemToReg = 0;
										RegWr = 1;
										MemWr = 0;
										Jump = 0;
										JumpRs = 0;
										ALUcntrl = 2'b01;
										noRs = 0;
										noRt = 1;
									end
				default: 		begin
										RegDst = 1'bx;
										ALUSrc = 1'bx;
										MemToReg = 1'bx;
										RegWr = 1'bx;
										MemWr = 1'bx;
										Jump = 1'bx;
										JumpRs = 1'bx;
										ALUcntrl = 2'bxx;
										noRs = 1'bx;
										noRt = 1'bx;
									end
	endcase



endmodule 
