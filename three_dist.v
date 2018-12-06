`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:56 10/15/2018 
// Design Name: 
// Module Name:    three_dist 
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
module three_dist(
    input [31:0] InstructionD,
    input [31:0] InstructionW,
    input inconf,
    input [3:0] intype,
    output reg [3:0] outtype
    );

always @ (inconf or intype or InstructionD or InstructionW)
begin
	outtype <= intype;

	// 再判断指令距离为3时是否有冲突
	if(inconf == 1'b0)
	begin
	case(InstructionW[31:26])
		// src: MEM/WB R-R ALU
		6'b000000:
		begin
			case(InstructionD[31:26])
				// dest:	R-R ALU
				6'b000000:
				begin
					if(InstructionD[25:21] == InstructionW[15:11])			outtype <= 4'h9;
					else if(InstructionD[20:16] == InstructionW[15:11])	outtype <= 4'ha;
				end
				
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionW[15:11])			outtype <= 4'h9;
				end
				
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionW[15:11])			outtype <= 4'h9;
				end
				
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionW[15:11])			outtype <= 4'h9;
				end
				
			endcase
		end
		
		// src: MEM/WB Load
		6'b100011:
		begin
			case(InstructionD[31:26])
				// dest:	R-R ALU
				6'b000000:
				begin
					if(InstructionD[25:21] == InstructionW[20:16])			outtype <= 4'hb;
					else if(InstructionD[20:16] == InstructionW[20:16])	outtype <= 4'hc;
				end
				
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionW[20:16])			outtype <= 4'hb;
				end
				
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionW[20:16])			outtype <= 4'hb;
				end
				
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionW[20:16])			outtype <= 4'hb;
				end
				
			endcase
		end
		
	endcase
	end

end

endmodule
