`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:36 07/04/2018 
// Design Name: 
// Module Name:    BCD 
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
module BCD(
    input DP,
    output [7:0] A,
    input [3:0] S
    );
/////////////////////////////
reg [7:0] BA;
/////////////////////////////
always@(DP,S)
  begin
    if (DP==1'b1)
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
	 else
	    begin
		   case (S)      //abcdefg DP
			  4'b0000: BA=8'b00000010;
			  4'b0001: BA=8'b10011110;
			  4'b0010: BA=8'b00100100;
			  4'b0011: BA=8'b00001100;
			  4'b0100: BA=8'b10011000;
			  4'b0101: BA=8'b01001000;
			  4'b0110: BA=8'b01000000;
			  4'b0111: BA=8'b00011110;
			  4'b1000: BA=8'b00000000;
			  4'b1001: BA=8'b00001000;
			  4'b1010: BA=8'b11111100;
			  default BA=8'b00000010;
			endcase
		 end
  end
//////////////////////////
assign A=BA;

endmodule
