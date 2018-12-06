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
	 output reg [3:0] type
    );

reg [31:0] InstructionD;
reg [31:0] InstructionE;
reg [31:0] InstructionM;
reg [31:0] InstructionW;

wire one_dist_conf;
wire two_dist_conf;
wire [3:0] first_type;
wire [3:0] second_type;
wire [3:0] third_type;

	one_dist one_dist(
	.InstructionD(InstructionD),
	.InstructionE(InstructionE),
	.conf(one_dist_conf),
	.outtype(first_type)
	);
	
	two_dist two_dist(
	.InstructionD(InstructionD),
	.InstructionM(InstructionM),
	.inconf(one_dist_conf),
	.intype(first_type),
	.conf(two_dist_conf),
	.outtype(second_type)
	);
	
	three_dist three_dist(
	.InstructionD(InstructionD),
	.InstructionW(InstructionW),
	.inconf(two_dist_conf),
	.intype(second_type),
	.outtype(third_type)
	);

/*
若需要定向，则在Data_selector模块中选择数据源
若需要暂停，则在主模块中进行PC不变及执行阶段给空值操作
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
	else if(third_type == 4'h3 | third_type == 4'h4)
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

always @ (third_type)
begin
	type <= third_type;
end

/*
always @ (Clk)
begin
	type <= 4'h0;
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
						type <= 4'h1;
					end
					else if(InstructionD[20:16] == InstructionE[15:11])
					begin
						conf <= 1'b1;
						type <= 4'h2;
					end
				end
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionE[15:11])
					begin
						conf <= 1'b1;
						type <= 4'h1;
					end
				end
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionE[15:11])
					begin
						conf <= 1'b1;
						type <= 4'h1;
					end
				end
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionE[15:11])
					begin
						conf <= 1'b1;
						type <= 4'h1;
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
						type <= 4'h5;
					end
					else if(InstructionD[20:16] == InstructionE[20:16])
					begin
						conf <= 1'b1;
						type <= 4'h6;
					end
				end
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionE[20:16])
					begin
						conf <= 1'b1;
						type <= 4'h5;
					end
				end
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionE[20:16])
					begin
						conf <= 1'b1;
						type <= 4'h5;
					end
				end
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionE[20:16])
					begin
						conf <= 1'b1;
						type <= 4'h5;
					end
				end
			
			endcase
		end
		
	endcase
	
	// 再判断指令距离为2时是否有冲突
	if(conf == 1'b0)
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
						type <= 4'h3;
						conf <= 1'b1;
					end
					else if(InstructionD[20:16] == InstructionM[15:11])	
					begin
						type <= 4'h4;
						conf <= 1'b1;
					end
				end
				
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionM[15:11])			
					begin
						type <= 4'h3;
						conf <= 1'b1;
					end
				end
				
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionM[15:11])			
					begin
						type <= 4'h3;
						conf <= 1'b1;
					end
				end
				
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionM[15:11])			
					begin
						type <= 4'h3;
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
						type <= 4'h7;
						conf <= 1'b1;
					end
					else if(InstructionD[20:16] == InstructionM[20:16])	
					begin
						type <= 4'h8;
						conf <= 1'b1;
					end
				end
				
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionM[20:16])			
					begin
						type <= 4'h7;
						conf <= 1'b1;
					end
				end
				
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionM[20:16])			
					begin
						type <= 4'h7;
						conf <= 1'b1;
					end
				end
				
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionM[20:16])			
					begin
						type <= 4'h7;
						conf <= 1'b1;
					end
				end
				
			endcase
		end
		
	endcase
	end
	
	// 再判断指令距离为3时是否有冲突
	if(conf == 1'b0)
	begin
	case(InstructionW[31:26])
		// src: MEM/WB R-R ALU
		6'b000000:
		begin
			case(InstructionD[31:26])
				// dest:	R-R ALU
				6'b000000:
				begin
					if(InstructionD[25:21] == InstructionW[15:11])			type <= 4'h9;
					else if(InstructionD[20:16] == InstructionW[15:11])	type <= 4'ha;
				end
				
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionW[15:11])			type <= 4'h9;
				end
				
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionW[15:11])			type <= 4'h9;
				end
				
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionW[15:11])			type <= 4'h9;
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
					if(InstructionD[25:21] == InstructionW[20:16])			type <= 4'hb;
					else if(InstructionD[20:16] == InstructionW[20:16])	type <= 4'hc;
				end
				
				// dest: Load
				6'b100011:
				begin
					if(InstructionD[25:21] == InstructionW[20:16])			type <= 4'hb;
				end
				
				// dest: Store
				6'b101011:
				begin
					if(InstructionD[25:21] == InstructionW[20:16])			type <= 4'hb;
				end
				
				// dest: beq
				6'b000100:
				begin
					if(InstructionD[25:21] == InstructionW[20:16])			type <= 4'hb;
				end
				
			endcase
		end
		
	endcase
	end

end
*/
endmodule
