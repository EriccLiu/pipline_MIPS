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
    //input inconf,
    input [5:0] intype,
	 //output reg conf,
    output reg [5:0] outtype
    );

always @ (*)
begin
	// 初始化输出类型,后续会覆盖
	outtype <= intype;
	
	case(InstructionD[31:26])
	
	// dest: R-R ALU
	6'b000000:
	begin
		case(InstructionM[31:26])
		
		// src: R-R ALU
		6'b000000:
		begin
			// 若有冲突赋值对应位10表示距离为2冲突
			
			// 与第一个操作数冲突
			if(InstructionD[25:21] == InstructionM[15:11] & intype[3:2] == 2'b00)
			begin
				outtype[5] <= 1'b0;
				outtype[3:2] <= 2'b10;
			end
			// 与第二个操作数冲突
			if(InstructionD[20:16] == InstructionM[15:11] & intype[3:2] == 2'b00)
			begin
				outtype[4] <= 1'b0;
				outtype[1:0] <= 2'b10;
			end
		end
		
		// src: Load
		6'b100011:
		begin
			// 若有冲突赋值对应位10表示距离为2冲突
			
			// 与第一个操作数冲突
			if(InstructionD[25:21] == InstructionM[20:16] & intype[3:2] == 2'b00)
			begin
				outtype[5] <= 1'b1;
				outtype[3:2] <= 2'b10;
			end
			// 与第二个操作数冲突
			if(InstructionD[20:16] == InstructionM[20:16] & intype[1:0] == 2'b00)
			begin
				outtype[4] <= 1'b1;
				outtype[1:0] <= 2'b10;
			end
		end
		
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
			// 若有冲突赋值对应位10表示距离为2冲突
			
			// 与(第一个)操作数冲突
			if(InstructionD[25:21] == InstructionM[15:11] & intype[3:0] == 4'b0000)
			begin
				outtype[5] <= 1'b0;
				outtype[3:0] <= 4'b1011;
			end
		
		// src: Load
		6'b100011:
			// 若有冲突赋值对应位10表示距离为2冲突
			
			// 与(第一个)操作数冲突
			if(InstructionD[25:21] == InstructionM[20:16] & intype[3:0] == 4'b0000)
			begin
				outtype[5] <= 1'b1;
				outtype[3:0] <= 4'b1011;
			end
		
		endcase
	end
	
	endcase
	
end

/*
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
*/

endmodule
