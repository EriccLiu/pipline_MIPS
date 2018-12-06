`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:59 12/07/2011 
// Design Name: 
// Module Name:    register 
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
module register(
    input Clk,
    input [4:0] RegARdAddr,
    input [4:0] RegBRdAddr,
    input [4:0] RegWrAddr,
    input [31:0] RegWrData,
    input RegWrite,
    output reg [31:0] RegARdData,
    output reg [31:0] RegBRdData
    );
	
	reg [31:0] regFile[0:31];	//32 x 32bit registers
	
	reg [31:0] RegATemp;
	reg [31:0] RegBTemp;
	
initial
begin
	$readmemh("register",regFile,32'h0);
end
	
	//write and read on rising clock edge
always @ (negedge Clk)
begin
	RegATemp <= (RegARdAddr != 0) ? regFile[RegARdAddr] : 0;
   RegBTemp <= (RegBRdAddr != 0) ? regFile[RegBRdAddr] : 0;

end

always @ (posedge Clk)
begin
	RegARdData <= RegATemp;
   RegBRdData <= RegBTemp;
   if(RegWrite == 1'b1)
      regFile[RegWrAddr]<= RegWrData;
end
	
endmodule
