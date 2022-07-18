`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:34:27 07/04/2018 
// Design Name: 
// Module Name:    BCD1 
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
module BCD1(
    output [7:0] A,
    input [3:0] S
    );
/////////////////////////////
reg [7:0] BA;
/////////////////////////////
always@(S)
  begin
	 case (S)      //abcdefg DP
		4'b0000: BA=8'b00000011;
		4'b0001: BA=8'b10011111;
		4'b0010: BA=8'b00100101;
		4'b0011: BA=8'b00001101;
		4'b0100: BA=8'b10011001;
		4'b0101: BA=8'b01001001;
		4'b0110: BA=8'b01000001;
		4'b0111: BA=8'b00011111;
		4'b1000: BA=8'b00000001;
		4'b1001: BA=8'b00001001;
		4'b1010: BA=8'b11111101;
		default BA=8'b00000011;
	  endcase    
  end
///////////////////////////////
assign A=BA;
endmodule
