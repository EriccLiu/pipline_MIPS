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
    input inconf,
    input [3:0] intype,
    output reg conf,
    output reg [3:0] outtype
    );

always @ (inconf or intype or InstructionD or InstructionM)
begin
	conf <= inconf;
	outtype <= intype;

	// 再判断指令距离为2时是否有冲突
	if(inconf == 1'b0)
	begin
	case(InstructionM[31:26])
		// src: MEM/WB R-R ALU
		6'b000000:
		begin
			case(InstructionD[31:26])
				// dest:	R-R ALU
				6'b000000:
				begin
					if(InstructionD[25:21] == InstructionM[15:11])			
					begin
						outtype <= 4'h5;
						conf <= 1'b1;
					end
					else if(InstructionD[20:16] == InstructionM[15:11])	
					begin
						outtype <= 4'h6;
						conf <= 1'b1;
					end
				end
				
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionM[15:11])			
					begin
						outtype <= 4'h5;
						conf <= 1'b1;
					end
				end
				
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionM[15:11])			
					begin
						outtype <= 4'h5;
						conf <= 1'b1;
					end
				end
				
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionM[15:11])			
					begin
						outtype <= 4'h5;
						conf <= 1'b1;
					end
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
					if(InstructionD[25:21] == InstructionM[20:16])			
					begin
						outtype <= 4'h7;
						conf <= 1'b1;
					end
					else if(InstructionD[20:16] == InstructionM[20:16])	
					begin
						outtype <= 4'h8;
						conf <= 1'b1;
					end
				end
				
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionM[20:16])			
					begin
						outtype <= 4'h7;
						conf <= 1'b1;
					end
				end
				
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionM[20:16])			
					begin
						outtype <= 4'h7;
						conf <= 1'b1;
					end
				end
				
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionM[20:16])			
					begin
						outtype <= 4'h7;
						conf <= 1'b1;
					end
				end
				
			endcase
		end
		
	endcase
	end
	
end

endmodule
