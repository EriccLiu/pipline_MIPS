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

always @ (*)
begin
	// ��ʼ������ֹ©�����
	SrcAE <= ReadSrcAE;
	SrcBE <= ReadSrcBE;
	
	case(type[5:4])
	
		// Դ��ΪR��ָ����޳�ͻ
		2'b00:
		begin
			// ��type����λΪ11����˵��Ŀ��ָ��ΪLoad,Store��Beq
			if(type[1:0] == 2'b11)
			begin
				// ����Ϊ1��ͻ
				if(type[3:2] == 2'b01)
				begin
					SrcAE <= ALUOutM;
					SrcBE <= ReadSrcBE;
				end
				// ����Ϊ2��ͻ
				else if(type[3:2] == 2'b10)
				begin
					SrcAE <= ALUOutW;
					SrcBE <= ReadSrcBE;
				end
				
			end
			
			// ��type����λ����11����˵��Ŀ��ָ��ΪR�࣬���޳�ͻ
			else
			begin
				// ��һ����������ֵ
				// �޳�ͻ
				if(type[3:2] == 2'b00) SrcAE <= ReadSrcAE;
				// ����Ϊ1��ͻ
				else if(type[3:2] == 2'b01) SrcAE <= ALUOutM;
				// ����Ϊ2��ͻ
				else if(type[3:2] == 2'b10) SrcAE <= ALUOutW;
				
				// �ڶ�����������ֵ
				// �޳�ͻ
				if(type[1:0] == 2'b00) SrcBE <= ReadSrcBE;
				// ����Ϊ1��ͻ
				else if(type[1:0] == 2'b01) SrcBE <= ALUOutM;
				// ����Ϊ2��ͻ
				else if(type[1:0] == 2'b10) SrcBE <= ALUOutW;

			end
		end
		
		
		// ��һ��ԴΪRָ����޳�ͻ���ڶ���ԴΪLoadָ��
		// ֻ������R��ָ���ͻ����Ϊ��L/S/Bָ���ͻʱtypeǰ��λΪ10
		2'b01:
		begin
			// ��һ����������ֵ
			// �޳�ͻ
			if(type[3:2] == 2'b00) SrcAE <= ReadSrcAE;
			// ����Ϊ1��ͻ
			else if(type[3:2] == 2'b01) SrcAE <= ALUOutM;
			// ����Ϊ2��ͻ
			else if(type[3:2] == 2'b10) SrcAE <= ALUOutW;
			
			// �ڶ�����������ֵ
			// �޳�ͻtypeǰ��λΪ00
			// ����Ϊ1��ͻΪ��ͣ����������
			// ����Ϊ2��ͻ
			if(type[1:0] == 2'b10) SrcBE <= ReadDataW;
		end
		
		
		// ��һ��ԴΪLoadָ��ڶ���ԴΪRָ����޳�ͻ
		2'b10:
		begin
		// ��type����λΪ11����˵��Ŀ��ָ��ΪLoad,Store��Beq
			if(type[1:0] == 2'b11)
			begin
				// ����Ϊ1��ͻ,��ͣ��������
				// ����Ϊ2��ͻ
				if(type[3:2] == 2'b10)
				begin
					SrcAE <= ReadDataW;
					SrcBE <= ReadSrcBE;
				end
			end
			
			// ��type����λ����11����˵��Ŀ��ָ��ΪR��
			else
			begin
				// ��һ����������ֵ
				// �޳�ͻ
				if(type[3:2] == 2'b00) SrcAE <= ReadSrcAE;
				// ����Ϊ1��ͻ����ͣ��������
				// ����Ϊ2��ͻ
				else if(type[3:2] == 2'b10) SrcAE <= ALUOutW;
				
				// �ڶ�����������ֵ
				// �޳�ͻ
				if(type[1:0] == 2'b00) SrcBE <= ReadSrcBE;
				// ����Ϊ1��ͻ
				else if(type[1:0] == 2'b01) SrcBE <= ALUOutM;
				// ����Ϊ2��ͻ
				else if(type[1:0] == 2'b10) SrcBE <= ALUOutW;

			end
		end
		
		
		// Դ��ΪLoadָ��
		2'b11:
		begin
			// ��Ҫ��ͣ���������������
			if(type[3:0] == 4'b1111)
			begin
				
			end
			// ����Ϊ2��ͻ�����
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
