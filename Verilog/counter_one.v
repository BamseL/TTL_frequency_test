`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:48 07/04/2018 
// Design Name: 
// Module Name:    counter_one 
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
module counter_one(
    input clock_con_one,
    input clear,
    input c_in,
    output c_out,
    output [3:0] s
    );
///////////////////////
reg [3:0] counter=4'd0000;
//////////////////////
always@(posedge clock_con_one)
  begin
  if (clear)
     begin
       counter<=4'b0000;
	  end
  else  
    begin
	   if (c_in)
		   if (counter<4'b1001)
			   begin
			     counter<=counter+1;
				end
			else
			   begin
			     counter<=4'b0000;
				end
	 end
  end
/////////////////
assign s=counter;
assign c_out=(counter==4'b1001)&&c_in; 
endmodule
