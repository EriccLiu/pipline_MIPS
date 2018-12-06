`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:59:32 10/15/2018 
// Design Name: 
// Module Name:    two_dist 
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
module two_dist(
    input [31:0] InstructionD,
    input [31:0] InstructionM,
    input [5:0] intype,
    output reg [5:0] outtype
    );

always @ (*)
begin
	// ��ʼ���������,�����Ḳ��
	outtype <= intype;
	
	case(InstructionD[31:26])
	
	// dest: R-R ALU
	6'b000000:
	begin
		case(InstructionM[31:26])
		
		// src: R-R ALU
		6'b000000:
		begin
			// ���г�ͻ��ֵ��Ӧλ10��ʾ����Ϊ2��ͻ
			
			// ���һ����������ͻ
			if(InstructionD[25:21] == InstructionM[15:11] & intype[3:2] == 2'b00)
			begin
				outtype[5] <= 1'b0;
				outtype[3:2] <= 2'b10;
			end
			// ��ڶ�����������ͻ
			if(InstructionD[20:16] == InstructionM[15:11] & intype[1:0] == 2'b00)
			begin
				outtype[4] <= 1'b0;
				outtype[1:0] <= 2'b10;
			end
		end
		
		// src: Load
		6'b100011:
		begin
			// ���г�ͻ��ֵ��Ӧλ10��ʾ����Ϊ2��ͻ
			
			// ���һ����������ͻ
			if(InstructionD[25:21] == InstructionM[20:16] & intype[3:2] == 2'b00)
			begin
				outtype[5] <= 1'b1;
				outtype[3:2] <= 2'b10;
			end
			// ��ڶ�����������ͻ
			if(InstructionD[20:16] == InstructionM[20:16] & intype[1:0] == 2'b00)
			begin
				outtype[4] <= 1'b1;
				outtype[1:0] <= 2'b10;
			end
		end
		
		default:
			outtype <= intype;
		
		endcase
	end
	
	// dest: Load, Store, Beq
	6'b100011,
	6'b101011,
	6'b000100:
	begin
		case(InstructionM[31:26])
		// src: R-R ALU
		6'b000000:
			// ���г�ͻ��ֵ��Ӧλ10��ʾ����Ϊ2��ͻ
			
			// ��(��һ��)��������ͻ
			if(InstructionD[25:21] == InstructionM[15:11] & intype[3:0] == 4'b0000)
			begin
				outtype[5] <= 1'b0;
				outtype[3:0] <= 4'b1011;
			end
		
		// src: Load
		6'b100011:
			// ���г�ͻ��ֵ��Ӧλ10��ʾ����Ϊ2��ͻ
			
			// ��(��һ��)��������ͻ
			if(InstructionD[25:21] == InstructionM[20:16] & intype[3:0] == 4'b0000)
			begin
				outtype[5] <= 1'b1;
				outtype[3:0] <= 4'b1011;
			end
		
		default:
			outtype <= intype;
		
		endcase
	end
	
	default:
		outtype <= intype;
	
	endcase
	
end

endmodule
