`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:22:21 10/15/2018 
// Design Name: 
// Module Name:    InstructionD_judger 
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
module InstructionD_judger(
    input [31:0] InstructionD,
    output reg [1:0] optype
    );

always @ (InstructionD)
begin
	case(InstructionD[31:26])
		// dest:	R-R ALU
		6'b000000:
		begin
			optype <= 2'b10;
		end
		
		// dest: Load
		6'b100011:
		begin
			optype <= 2'b01;
		end
		
		// dest: Store
		6'b101011:
		begin
			optype <= 2'b01;
		end
		
		// dest: beq
		6'b000100:
		begin
			optype <= 2'b01;
		end
		
		default:
		begin
			optype <= 2'b00;
		end
	endcase
end

endmodule
