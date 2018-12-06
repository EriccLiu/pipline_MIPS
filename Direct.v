`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:02 10/10/2018 
// Design Name: 
// Module Name:    Direct 
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
module Direct(
	 input Rst,
	 input Clk,
    input [31:0] Instruction,
	 //output reg [3:0] type
    output reg [5:0] type
	 );

reg [31:0] InstructionD;
reg [31:0] InstructionE;
reg [31:0] InstructionM;
reg [31:0] InstructionW;

wire [5:0] first_type;
wire [5:0] second_type;

/*
wire one_dist_conf;
wire two_dist_conf;
wire [3:0] first_type;
wire [3:0] second_type;
wire [3:0] third_type;
*/
	one_dist one_dist(
	.InstructionD(InstructionD),
	.InstructionE(InstructionE),
	//.conf(one_dist_conf),
	.outtype(first_type)
	);
	
	two_dist two_dist(
	.InstructionD(InstructionD),
	.InstructionM(InstructionM),
	//.inconf(one_dist_conf),
	.intype(first_type),
	//.conf(two_dist_conf),
	.outtype(second_type)
	);
	
	/*
	three_dist three_dist(
	.InstructionD(InstructionD),
	.InstructionW(InstructionW),
	.inconf(two_dist_conf),
	.intype(second_type),
	.outtype(third_type)
	);
	*/

/*
若需要定向，则在Data_selector模块中选择数据源
若需要暂停，则在主模块中进行PC不变及执行阶段给空值操作
*/

/*
type共6位[5:0],默认6'b000000
前两位[5:4]表示源是R类指令还是Load指令,R类-0,Load-1
	当目的指令为Load, Store, Beq时,仅使用最高位[5];
	当目的指令为R类指令时,最高位[5]表示与第一操作数冲突的源指令类型,次高位[4]表示与第二操作数冲突的源指令类型
当目的指令是Load,Store,Beq时,type[1:0]=11
	当冲突距离为1时,type[3:2]=01;冲突距离为2时,type[3:2]=10;无冲突时,type[3:2]=00
当目的指令是R类指令时
	type[3:2]十进制值表示第一操作数冲突的距离;
	type[1:0]十进制值表示第二操作数冲突的距离;
	2'b00表示对应无冲突

*/

// 译码阶段指令随时更新
always @ (Instruction or Rst)
begin
	if(Rst == 1'b1)
		InstructionD <= 32'hffffffff;
	else
		InstructionD <= Instruction;
end

// 执行阶段指令由译码阶段指令提供
always @ (posedge Clk or posedge Rst)
begin
	if(Rst == 1'b1)
		InstructionE <= 32'hffffffff;
	else if(second_type == 6'b111111)
		InstructionE <= 32'hffffffff;
	else
		InstructionE <= InstructionD;
end
// 访存阶段指令由执行阶段指令提供
always @ (posedge Clk or posedge Rst)
begin
	if(Rst == 1'b1)
		InstructionM <= 32'hffffffff;
	else
		InstructionM <= InstructionE;
end
// 回写阶段指令由执行阶段指令提供
always @ (posedge Clk or posedge Rst)
begin
	if(Rst == 1'b1)
		InstructionW <= 32'hffffffff;
	else
		InstructionW <= InstructionM;
end

/*
always @ (third_type)
begin
	type <= third_type;
end
*/

always @ (second_type)
begin
	type <= second_type;
end

endmodule
