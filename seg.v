`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:41:12 07/04/2018 
// Design Name: 
// Module Name:    seg 
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
module seg(
    input clock_led,
    input [3:0] l_0,
    input [3:0] l_1,
    input [3:0] l_2,
    input [3:0] l_3,
    input DP_1,
    input DP_2,
    input DP_3,
    output [7:0] L,
    output [3:0] N
    );
//////////////////////////////////
reg [1:0] sreg=2'b00,
          snext=2'b01;
parameter [1:0] A1=2'b00,
                B1=2'b01,
					 C1=2'b10,
					 D1=2'b11;
reg [7:0] L0;
wire [7:0] A,B,C,D;
reg [4:0] N0;
/////////////////////////////////
always@(posedge clock_led)
  sreg<=snext;
///////////////////////////////
always@(sreg)
  begin
    case (sreg)      
		A1: snext=B1;
		B1: snext=C1;
		C1: snext=D1;
		D1: snext=A1;
		default snext=A1;
	  endcase   
  end
///////////////////////////////
BCD1 U10 (A,l_0);
BCD U11 (DP_1,B,l_1);
BCD U12 (DP_2,C,l_2);
BCD U13 (DP_3,D,l_3);
///////////////////////////////
always@(sreg,A,B,C,D)
 begin
    case (sreg)      
		A1: L0<=A;
		B1: L0<=B;
		C1: L0<=C;
		D1: L0<=D;
		default L0<=A;
	 endcase 
 end
/////////////////////
always@(sreg)
 begin
    case (sreg)      
		A1: N0<=4'b1110;
		B1: N0<=4'b1101;
		C1: N0<=4'b1011;
		D1: N0<=4'b0111;
		default N0<=4'b1110;
	 endcase 
 end
/////////////////////////
assign L=L0;
assign N=N0;
endmodule
