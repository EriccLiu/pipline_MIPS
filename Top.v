`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:16 12/07/2011 
// Design Name: 
// Module Name:    Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Top(
    input Clk,
    input Rst,
	 input [7:0] Switch,
	 output [31:0] Test,
	 output [7:0] Led
    );
	 
wire Zero;
wire [31:0] SignExtOut;
wire [31:0] ALURes;
wire [0:0] Wea;

//fetch internal signal
wire [31:0] PCPlus4F;
reg [31:0] PCF;

//Decode internal signal
wire RegWriteD;
wire MemToRegD;
wire MemWriteD;
wire BranchD;
wire [3:0]ALUControlD;
wire ALUSrcD;
wire RegDstD;
wire [31:0] InstructionD;
reg [31:0] PCPlus4D;

//Execute internal signal
wire [31:0] ReadSrcAE;
wire [31:0] ReadSrcBE;
wire [31:0] SrcAE;
wire [31:0] SrcBE;
wire [31:0] WriteDataE;
reg RegWriteE;
reg MemToRegE;
reg MemWriteE;
reg BranchE;
reg ALUSrcE;
reg RegDstE;
reg [3:0] ALUControlE;
reg [4:0] RtE;
reg [4:0] RdE;
wire [4:0] WriteRegE;
reg [31:0] PCPlus4E;
reg [31:0] SignExtOutE;


//Memory internal signal

wire PCSrcM;
reg ZeroM;
reg RegWriteM;
reg MemToRegM;
reg MemWriteM;
reg BranchM;
reg [4:0] WriteRegM;
reg [31:0] PCBranchM;
reg [31:0] WriteDataM;
reg [31:0] ALUOutM;

//Write back internal signal
wire [31:0] ResultW;
wire[31:0] ReadDataW;
reg RegWriteW;
reg MemToRegW;
reg [31:0] ALUOutW;
reg [4:0] WriteRegW;

wire [5:0] ConflictTypeD;
reg [5:0] ConflictTypeE;

	Direct Direct(
	.Rst(Rst),
	.Clk(Clk),
	.Instruction(InstructionD),
	.type(ConflictTypeD)
	);

	Data_selector Data_selector(
	.Clk(Clk),
	.type(ConflictTypeE),
	.ALUOutM(ALUOutM),
   .ALUOutW(ALUOutW),
   .ReadDataW(ReadDataW),
	.ResultW(ResultW),
   .ReadSrcAE(ReadSrcAE),
   .ReadSrcBE(ReadSrcBE),
   .SrcAE(SrcAE),
   .SrcBE(SrcBE)
	);

	Ctr Ctr (
	.OpCode(InstructionD[31:26]), 
	.Funct(InstructionD[5:0]),
	.MemToRegD(MemToRegD), 
	.RegDstD(RegDstD), 
   .ALUSrcD(ALUSrcD),
	.MemWriteD(MemWriteD), 
	.BranchD(BranchD), 
   .RegWriteD(RegWriteD),
	.ALUControlD(ALUControlD)
	);

	Data_memory Data_memory(
	.Clk(Clk),
   .DmemAddr(ALUOutM),
   .DmemRdData(ReadDataW),
   .DmemWrite(MemWriteM),
   .DmemWrData(WriteDataM)
	);

//assign wea[0] = MemWriteM;
	Instruction_memory Imem(
	.Clk(Clk),
	.Rst(Rst),
	.ImemRdAddr(PCF>>2),
	.type(ConflictTypeD),
	.Instruction(InstructionD)
	);
	
	register register (
	.Clk(Clk), 
	.RegARdAddr(InstructionD[25:21]), 
	.RegBRdAddr(InstructionD[20:16]), 
	.RegWrAddr(WriteRegW), 
	.RegWrData(ResultW), 
	.RegWrite(RegWriteW),
	.RegARdData(ReadSrcAE),
	.RegBRdData(WriteDataE)
	);

	ALU ALU (
	.SrcA(SrcAE), 
	.SrcB(SrcBE), 
	.ALUCtr(ALUControlE), 
	.Zero(Zero), 
	.ALURes(ALURes)
	);

	signext signext (
    .Inst(InstructionD[15:0]), 
    .Data(SignExtOut)
    );
	
//Pipeline Stage 1: fetch
always @ (posedge Clk or posedge Rst)
begin
	if(Rst == 1'b1)
		begin
			PCF <= 32'b0;
		end
	else begin
		if(PCSrcM ==1'b1)
			PCF <= PCBranchM;
		else
			PCF <= PCPlus4F;
	end
	
end
// 判断是否是需要暂停的冲突类型
assign PCPlus4F = (ConflictTypeD == 6'b111111) ? PCF : PCF + 4;

//Pipeline Stage 2:Decode
always @(posedge Clk)
begin
	PCPlus4D <= PCPlus4F;

end
	
//Pipeline Stage 3:Execute
always @ (posedge Clk)
begin
	// 若发现为需要暂停指令，则给执行周期全空以暂停
	if(ConflictTypeD == 6'b111111)
	begin
		RegWriteE   <= 0;
		MemToRegE   <= 0;
		MemWriteE   <= 0;
		BranchE     <= 0;
		ALUControlE <= 0;
		ALUSrcE     <= 0;
		RegDstE     <= 0;
		PCPlus4E    <= 0;
		SignExtOutE <= 0;
		RtE         <= 0;
		RdE         <= 0;
		ConflictTypeE <= ConflictTypeD;
	end
	else
	begin
		RegWriteE   <= RegWriteD;
		MemToRegE   <= MemToRegD;
		MemWriteE   <= MemWriteD;
		BranchE     <= BranchD;
		ALUControlE <= ALUControlD;
		ALUSrcE     <= ALUSrcD;
		RegDstE     <= RegDstD;
		PCPlus4E    <= PCPlus4D;
		SignExtOutE <= SignExtOut;
		RtE         <= InstructionD[20:16];
		RdE         <= InstructionD[15:11];
		ConflictTypeE <= ConflictTypeD;
	end	

end
assign ReadSrcBE = (ALUSrcE ==1'b0)? WriteDataE:SignExtOutE;
assign WriteRegE = (RegDstE==1'b0) ? RtE : RdE;

//Pipline Stage 4: Memory
always @ (posedge Clk)
begin
    RegWriteM   <= RegWriteE;
    MemToRegM   <= MemToRegE;
    MemWriteM   <= MemWriteE;
    BranchM     <= BranchE;
    ZeroM       <= Zero;
    ALUOutM     <= ALURes;
    WriteDataM  <= WriteDataE;
    WriteRegM   <= WriteRegE;
    PCBranchM   <= PCPlus4E + (SignExtOutE<<2);
end
	
assign PCSrcM = BranchM & ZeroM;

//Pipline Stage 5:Write back
always @ (posedge Clk)
begin
    ALUOutW     <= ALUOutM;
    WriteRegW   <= WriteRegM;
    RegWriteW   <= RegWriteM;
    MemToRegW   <= MemToRegM;
end
assign ResultW = (MemToRegW == 1'b0)? ALUOutW :ReadDataW;

//output led
assign Led = ALUOutW[7:0];
assign Test = PCF;
	
endmodule
