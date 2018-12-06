`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:46 10/15/2018 
// Design Name: 
// Module Name:    one_dist 
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
module one_dist(
    input [31:0] InstructionD,
    input [31:0] InstructionE,
    //output reg conf,
    output reg [5:0] outtype
    );

always @ (*)
begin
	// ��ʼ��������ͣ������Ḳ��
	outtype <= 6'b000000;
	
	case(InstructionD[31:26])
	
	// dest: R-R ALU
	6'b000000:
	begin
		case(InstructionE[31:26])
		
		// src: R-R ALU
		6'b000000:
		begin
			// ���г�ͻ��ֵ��Ӧλ01��ʾ����Ϊ1��ͻ
			
			// ���һ����������ͻ
			if(InstructionD[25:21] == InstructionE[15:11])
			begin
				outtype[5] <= 1'b0;
				outtype[3:2] <= 2'b01;
			end
			// ��ڶ�����������ͻ
			if(InstructionD[20:16] == InstructionE[15:11])
			begin
				outtype[4] <= 1'b0;
				outtype[1:0] <= 2'b01;
			end
		end
		
		// src: Load
		6'b100011:
		begin
			// ���г�ͻ��ֵ��Ӧλ01��ʾ����Ϊ1��ͻ
			
			// ���һ����������ͻ
			if(InstructionD[25:21] == InstructionE[20:16])
			begin
				outtype <= 6'b111111;
			end
			// ��ڶ�����������ͻ
			if(InstructionD[20:16] == InstructionE[20:16])
			begin
				outtype <= 6'b111111;
			end
		end
		
		endcase
	end
	
	// dest: Load, Store, Beq
	6'b100011,
	6'b101011,
	6'b000100:
	begin
		case(InstructionE[31:26])
		// src: R-R ALU
		6'b000000:
			// ���г�ͻ��ֵ��Ӧλ01��ʾ����Ϊ1��ͻ
			
			// ��(��һ��)��������ͻ
			if(InstructionD[25:21] == InstructionE[15:11])
			begin
				outtype[5] <= 1'b0;
				outtype[3:0] <= 4'b0111;
			end
		
		// src: Load
		6'b100011:
			// ���г�ͻ��ֵ��Ӧλ01��ʾ����Ϊ1��ͻ
			
			// ��(��һ��)��������ͻ
			if(InstructionD[25:21] == InstructionE[20:16])
			begin
				outtype <= 6'b111111;
			end
		
		endcase
	end
	
	endcase
	
end
/*
always @ (InstructionD or InstructionE)
begin
	conf <= 1'b0;
	outtype <= 4'h0;
	
	// ���ж�ָ�����Ϊ1ʱ�Ƿ��г�ͻ
	case(InstructionE[31:26])
		
		// src: EX/MEM R-R ALU
		6'b000000:
		begin
			case(InstructionD[31:26])
			
				// dest:	R-R ALU
				6'b000000:
				begin
					if(InstructionD[25:21] == InstructionE[15:11])
					begin
						conf <= 1'b1;
						outtype <= 4'h1;
					end
					else if(InstructionD[20:16] == InstructionE[15:11])
					begin
						conf <= 1'b1;
						outtype <= 4'h2;
					end
				end
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionE[15:11])
					begin
						conf <= 1'b1;
						outtype <= 4'h1;
					end
				end
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionE[15:11])
					begin
						conf <= 1'b1;
						outtype <= 4'h1;
					end
				end
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionE[15:11])
					begin
						conf <= 1'b1;
						outtype <= 4'h1;
					end
				end
				
			endcase
		end
		
		// src: EX/MEM Load
		6'b100011:
		begin
			case(InstructionD[31:26])
			
				// dest:	R-R ALU
				6'b000000:
				begin
					if(InstructionD[25:21] == InstructionE[20:16])			
					begin
						conf <= 1'b1;
						outtype <= 4'h3;
					end
					else if(InstructionD[20:16] == InstructionE[20:16])
					begin
						conf <= 1'b1;
						outtype <= 4'h4;
					end
				end
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionE[20:16])
					begin
						conf <= 1'b1;
						outtype <= 4'h3;
					end
				end
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionE[20:16])
					begin
						conf <= 1'b1;
						outtype <= 4'h3;
					end
				end
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionE[20:16])
					begin
						conf <= 1'b1;
						outtype <= 4'h3;
					end
				end
			
			endcase
		end
		
	endcase
end
*/
endmodule
