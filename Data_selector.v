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
    input [5:0] type,
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

always @ (*)
begin
	// 初始化，防止漏掉情况
	SrcAE <= ReadSrcAE;
	SrcBE <= ReadSrcBE;
	
	case(type[5:4])
	
		// 源均为R类指令，或无冲突
		2'b00:
		begin
			// 若type后两位为11，则说明目的指令为Load,Store或Beq
			if(type[1:0] == 2'b11)
			begin
				// 距离为1冲突
				if(type[3:2] == 2'b01)
				begin
					SrcAE <= ALUOutM;
					SrcBE <= ReadSrcBE;
				end
				// 距离为2冲突
				else if(type[3:2] == 2'b10)
				begin
					SrcAE <= ALUOutW;
					SrcBE <= ReadSrcBE;
				end
				
			end
			
			// 若type后两位不是11，则说明目的指令为R类，或无冲突
			else
			begin
				// 第一个操作数赋值
				// 无冲突
				if(type[3:2] == 2'b00) SrcAE <= ReadSrcAE;
				// 距离为1冲突
				else if(type[3:2] == 2'b01) SrcAE <= ALUOutM;
				// 距离为2冲突
				else if(type[3:2] == 2'b10) SrcAE <= ALUOutW;
				
				// 第二个操作数赋值
				// 无冲突
				if(type[1:0] == 2'b00) SrcBE <= ReadSrcBE;
				// 距离为1冲突
				else if(type[1:0] == 2'b01) SrcBE <= ALUOutM;
				// 距离为2冲突
				else if(type[1:0] == 2'b10) SrcBE <= ALUOutW;

			end
		end
		
		
		// 第一个源为R指令或无冲突，第二个源为Load指令
		// 只可能与R类指令冲突，因为与L/S/B指令冲突时type前两位为10
		2'b01:
		begin
			// 第一个操作数赋值
			// 无冲突
			if(type[3:2] == 2'b00) SrcAE <= ReadSrcAE;
			// 距离为1冲突
			else if(type[3:2] == 2'b01) SrcAE <= ALUOutM;
			// 距离为2冲突
			else if(type[3:2] == 2'b10) SrcAE <= ALUOutW;
			
			// 第二个操作数赋值
			// 无冲突type前两位为00
			// 距离为1冲突为暂停，不做操作
			// 距离为2冲突
			if(type[1:0] == 2'b10) SrcBE <= ReadDataW;
		end
		
		
		// 第一个源为Load指令，第二个源为R指令或无冲突
		2'b10:
		begin
		// 若type后两位为11，则说明目的指令为Load,Store或Beq
			if(type[1:0] == 2'b11)
			begin
				// 距离为1冲突,暂停不做操作
				// 距离为2冲突
				if(type[3:2] == 2'b10)
				begin
					SrcAE <= ReadDataW;
					SrcBE <= ReadSrcBE;
				end
			end
			
			// 若type后两位不是11，则说明目的指令为R类
			else
			begin
				// 第一个操作数赋值
				// 无冲突
				if(type[3:2] == 2'b00) SrcAE <= ReadSrcAE;
				// 距离为1冲突，暂停不做操作
				// 距离为2冲突
				else if(type[3:2] == 2'b10) SrcAE <= ALUOutW;
				
				// 第二个操作数赋值
				// 无冲突
				if(type[1:0] == 2'b00) SrcBE <= ReadSrcBE;
				// 距离为1冲突
				else if(type[1:0] == 2'b01) SrcBE <= ALUOutM;
				// 距离为2冲突
				else if(type[1:0] == 2'b10) SrcBE <= ALUOutW;

			end
		end
		
		
		// 源均为Load指令
		2'b11:
		begin
			// 需要暂停的情况，不做操作
			if(type[3:0] == 4'b1111)
			begin
				
			end
			// 距离为2冲突的情况
			else
			begin
				if(type[3:2] == 2'b10) SrcAE <= ReadDataW;
				if(type[1:0] == 2'b10) SrcBE <= ReadDataW;
			end
		end
	endcase
end

/*
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
*/

endmodule
