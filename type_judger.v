`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:21:43 10/15/2018 
// Design Name: 
// Module Name:    type_judger 
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
module type_judger(
    input [19:0] flag,
    output reg [3:0] type
    );

always @ (flag)
begin
	case(flag)
		// src:R, dest:R, ALU:up
		19'b1010xxxx10xxxxxxxxxx:
		type <= 4'h1;
		
		// src:R, dest:L/S/B, ALU:up
		19'b0110xxxx10xxxxxxxxxx:
		type <= 4'h2;
		
	endcase
end

endmodule
