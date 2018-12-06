`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:35 12/07/2011 
// Design Name: 
// Module Name:    Instruction_memory 
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
module Instruction_memory(
	 input Clk,
	 input Rst,
    input [31:0] ImemRdAddr,
	 input [3:0] type,
    output reg [31:0] Instruction
    );
	
reg [31:0] InstMem [0:255];	//memory space for storing instructions

//initial the instruction and data memory
initial
begin
	$readmemh("Instruction",InstMem,8'h0);
end

always @(posedge Clk)
begin
	if(Rst == 1'b1)
		Instruction <= 32'hffffffff;
	else if(type == 4'h3 | type == 4'h4)
		Instruction <= InstMem[ImemRdAddr - 1];
	else
		Instruction <= InstMem[ImemRdAddr];
end
endmodule
