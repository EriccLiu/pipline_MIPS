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
    output reg conf,
    output reg [3:0] outtype
    );

always @ (InstructionD or InstructionE)
begin
	conf <= 1'b0;
	outtype <= 4'h0;
	
	// 先判断指令距离为1时是否有冲突
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

endmodule
