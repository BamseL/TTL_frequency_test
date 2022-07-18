`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:39 07/04/2018 
// Design Name: 
// Module Name:    two_clk 
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
module two_clk(
    input clock,
    input reset,
    output clock_con,
    output clock_led
    );
reg s0,s1;
reg [16:0] counters;
reg [24:0] counter1;

always@(posedge clock or posedge reset)
  begin
    if (reset) 
       begin
	      s0<=1;
	      counters<=17'b0_0000_0000_0000_0000;
	    end
    else     
	     begin
	       counters<=counters+1; 
			 if (counters==17'b1_1110_1000_0100_1000) //--Æ¬Ñ¡200HZ
				 begin
					s0<=!s0;
					counters<=17'b0_0000_0000_0000_0000;
			    end
	     end
  end
///////////////////////////////////////////////
always@(posedge clock or posedge reset)
  begin
    if (reset)
       begin
	      s1<=1;
	      counter1<=25'b0_0000_0000_0000_0000_0000_0000;
	    end
    else
      begin
	     counter1<=counter1+1;
		  if (counter1==25'b1_0111_1101_0111_1000_0100_0000) //--¿ØÖÆÐÅºÅ1HZ
			  begin
			    s1<=!s1;
			    counter1<=25'b0_0000_0000_0000_0000_0000_0000;
			  end
	   end
  end
//////////////////////////
assign clock_led=s0;
assign clock_con=s1;
endmodule
