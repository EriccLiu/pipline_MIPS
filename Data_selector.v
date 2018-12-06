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

// ������һ��ResultW������ָ�����Ϊ3���
always @ (posedge Clk)
begin
		LastResultW <= ResultW;
end

/*
 type���Ͷ�Ӧ�ĳ�ͻ���ͣ�
 ָ�����Ϊ1ʱ
	ԴΪR��ָ��Ľ��
	1h��Ŀ����R��ָ�ִ������ָ������ȡֵ����ָ���һ��������
		Ŀ����Load/Store/Beqָ��
	2h��Ŀ����R��ָ�ִ������ָ������ȡֵ����ָ��ڶ���������
	ԴΪLoadָ��Ľ��
	3h��Ŀ����R��ָ�ִ������ָ������ȡֵ����ָ���һ��������
		Ŀ����Load/Store/Beqָ��
	4h��Ŀ����R��ָ�ִ������ָ������ȡֵ����ָ��ڶ���������
	3h �� 4h �������load��� R�� ָ���Ҫ��ͣ��Ȼ����ָ�����Ϊ2��ͻ����
	
	
 ָ�����Ϊ2ʱ
	ԴΪR��ָ��Ľ��
	5h��Ŀ����R��ָ��ô�����ָ������ȡֵ����ָ���һ��������
		Ŀ����Load/Store/Beqָ��
	6h��Ŀ����R��ָ��ô�����ָ������ȡֵ����ָ��ڶ���������
	ԴΪLoadָ��Ľ��
	7h��Ŀ����R��ָ��ô�����ָ������ȡֵ����ָ���һ��������
		Ŀ����Load/Store/Beqָ��
	8h��Ŀ����R��ָ��ô�����ָ������ȡֵ����ָ��ڶ���������
	
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
