`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:35 07/04/2018 
// Design Name: 
// Module Name:    latch 
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
module latch(
    input latch,
    output D1,
    output D2,
    output DP_1,
    output DP_2,
    output DP_3,
    input [3:0] led_0,
    input [3:0] led_1,
    input [3:0] led_2,
    input [3:0] led_3,
    input [3:0] led_4,
    input [3:0] led_5,
    output [3:0] latch_0,
    output [3:0] latch_1,
    output [3:0] latch_2,
    output [3:0] latch_3
    );
//////////////////////////////
reg latch_D1,latch_D2,latch_DP_1,latch_DP_2,latch_DP_3;
reg [3:0] latch_latch_0,latch_latch_1,latch_latch_2,latch_latch_3;
///////////////////////////////
always@(posedge latch)
  begin
  if (led_5==4'b0000)
     if (led_4==4'b0000)
	     if (led_3==4'b0000)
		     begin
			    latch_D1<=1;
			    latch_D2<=0;
			    latch_latch_0<=4'b0000;
			    latch_latch_1<=led_0;				  
			    latch_latch_2<=led_1;
		  	    latch_latch_3<=led_2;
				 latch_DP_1<=0;
             latch_DP_2<=1;
             latch_DP_3<=1; 
			  end
		  else
		     begin
			  	  latch_D1<=0;
				  latch_D2<=1;
				  latch_latch_0<=led_0;
				  latch_latch_1<=led_1;				  
				  latch_latch_2<=led_2;
				  latch_latch_3<=led_3;
              latch_DP_1<=1;
              latch_DP_2<=1;
              latch_DP_3<=0;
			  end
	  else
	     begin
		    	latch_D1<=0;
				latch_D2<=1;
				latch_latch_0<=led_1;
				latch_latch_1<=led_2;				  
				latch_latch_2<=led_3;
				latch_latch_3<=led_4;
            latch_DP_1<=1;
            latch_DP_2<=0;
            latch_DP_3<=1;
		  end
  else
     begin
	    	 latch_D1<=0;
			 latch_D2<=1;
			 latch_latch_0<=led_2;
			 latch_latch_1<=led_3;				  
			 latch_latch_2<=led_4;
			 latch_latch_3<=led_5;
          latch_DP_1<=0;
          latch_DP_2<=1;
          latch_DP_3<=1;
	  end		  
  end
//////////////////////////
assign D1=latch_D1;
assign D2=latch_D2;
assign DP_1=latch_DP_1;
assign DP_2=latch_DP_2;
assign DP_3=latch_DP_3;
assign latch_0=latch_latch_0;
assign latch_1=latch_latch_1;
assign latch_2=latch_latch_2;
assign latch_3=latch_latch_3;
endmodule
