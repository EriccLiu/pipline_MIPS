`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:40 12/07/2011 
// Design Name: 
// Module Name:    memory 
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
module Data_memory(
    input Clk,
    input [31:0] DmemAddr,
    output reg [31:0] DmemRdData,
    input DmemWrite,
    input [31:0] DmemWrData
    );

	reg [31:0] DataMem [0:1023];	//memory space: 1024*32bits

//initial the instruction and data memory
initial
begin
	$readmemh("data",DataMem,32'h0);
end

always @ (posedge Clk)
begin
	DmemRdData <= DataMem[DmemAddr];
   if(DmemWrite == 1'b1)
		DataMem[DmemAddr] <= DmemWrData;
end

endmodule
