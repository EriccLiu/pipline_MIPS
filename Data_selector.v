`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:00:46 10/12/2018 
// Design Name: 
// Module Name:    Data_selector 
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
module Data_selector(
	 input Clk,
    input [3:0] type,
    input [31:0] ALUOutM,
    input [31:0] ALUOutW,
    input [31:0] ReadDataW,
	 input [31:0] ResultW,
    input [31:0] ReadSrcAE,
    input [31:0] ReadSrcBE,
    output reg [31:0] SrcAE,
    output reg [31:0] SrcBE
    );

reg [31:0] LastResultW;	

// 保存上一个ResultW，用于指令距离为3情况
always @ (posedge Clk)
begin
		LastResultW <= ResultW;
end

/*
 type类型对应的冲突类型：
 指令距离为1时
	源为R类指令的结果
	1h：目的是R类指令，执行周期指令结果与取值周期指令第一个操作数
		目的是Load/Store/Beq指令
	2h：目的是R类指令，执行周期指令结果与取值周期指令第二个操作数
	源为Load指令的结果
	3h：目的是R类指令，执行周期指令结果与取值周期指令第一个操作数
		目的是Load/Store/Beq指令
	4h：目的是R类指令，执行周期指令结果与取值周期指令第二个操作数
	3h 和 4h 的情况是load后接 R类 指令，需要暂停，然后按照指令距离为2冲突处理
	
	
 指令距离为2时
	源为R类指令的结果
	5h：目的是R类指令，访存周期指令结果与取值周期指令第一个操作数
		目的是Load/Store/Beq指令
	6h：目的是R类指令，访存周期指令结果与取值周期指令第二个操作数
	源为Load指令的结果
	7h：目的是R类指令，访存周期指令结果与取值周期指令第一个操作数
		目的是Load/Store/Beq指令
	8h：目的是R类指令，访存周期指令结果与取值周期指令第二个操作数
	
*/

always @ (type or ALUOutM or ALUOutW or ReadDataW or ReadSrcAE or ReadSrcBE)
//always @ (posedge Clk)
begin
	case(type)
		4'h1:
		begin
			SrcAE <= ALUOutM;
			SrcBE <= ReadSrcBE;
		end
		
		4'h2:
		begin
			SrcAE <= ReadSrcAE;
			SrcBE <= ALUOutM;
		end
		
		4'h5:
		begin
			SrcAE <= ALUOutW;
			SrcBE <= ReadSrcBE;
		end
		
		4'h6:
		begin
			SrcAE <= ReadSrcAE;
			SrcBE <= ALUOutW;
		end
		
		4'h7:
		begin
			SrcAE <= ReadDataW;
			SrcBE <= ReadSrcBE;
		end
		
		4'h8:
		begin
			SrcAE <= ReadSrcAE;
			SrcBE <= ReadDataW;
		end
		
		default:
		begin
			SrcAE <= ReadSrcAE;
			SrcBE <= ReadSrcBE;
		end
		
	endcase

end

endmodule
