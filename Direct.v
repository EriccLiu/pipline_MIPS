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
����Ҫ��������Data_selectorģ����ѡ������Դ
����Ҫ��ͣ��������ģ���н���PC���估ִ�н׶θ���ֵ����
*/

/*
type��6λ[5:0],Ĭ��6'b000000
ǰ��λ[5:4]��ʾԴ��R��ָ���Loadָ��,R��-0,Load-1
	��Ŀ��ָ��ΪLoad, Store, Beqʱ,��ʹ�����λ[5];
	��Ŀ��ָ��ΪR��ָ��ʱ,���λ[5]��ʾ���һ��������ͻ��Դָ������,�θ�λ[4]��ʾ��ڶ���������ͻ��Դָ������
��Ŀ��ָ����Load,Store,Beqʱ,type[1:0]=11
	����ͻ����Ϊ1ʱ,type[3:2]=01;��ͻ����Ϊ2ʱ,type[3:2]=10;�޳�ͻʱ,type[3:2]=00
��Ŀ��ָ����R��ָ��ʱ
	type[3:2]ʮ����ֵ��ʾ��һ��������ͻ�ľ���;
	type[1:0]ʮ����ֵ��ʾ�ڶ���������ͻ�ľ���;
	2'b00��ʾ��Ӧ�޳�ͻ

*/

// ����׶�ָ����ʱ����
always @ (Instruction or Rst)
begin
	if(Rst == 1'b1)
		InstructionD <= 32'hffffffff;
	else
		InstructionD <= Instruction;
end

// ִ�н׶�ָ��������׶�ָ���ṩ
always @ (posedge Clk or posedge Rst)
begin
	if(Rst == 1'b1)
		InstructionE <= 32'hffffffff;
	else if(second_type == 6'b111111)
		InstructionE <= 32'hffffffff;
	else
		InstructionE <= InstructionD;
end
// �ô�׶�ָ����ִ�н׶�ָ���ṩ
always @ (posedge Clk or posedge Rst)
begin
	if(Rst == 1'b1)
		InstructionM <= 32'hffffffff;
	else
		InstructionM <= InstructionE;
end
// ��д�׶�ָ����ִ�н׶�ָ���ṩ
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
