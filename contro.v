`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:05 07/04/2018 
// Design Name: 
// Module Name:    contro 
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
module contro(
    input clock_con,
    input reset,
    output clear,
    output enable,
    output latch
    );
reg t1,t2;

always@(posedge clock_con or posedge reset)
  begin
  if (reset)
     t1<=0;
  else t1<=!t1;
  end

always@(negedge clock_con or posedge reset)
  begin
  if (reset)
     t2<=1;
  else t2<=!t1;
  end
assign enable=t1;
assign latch=t2;
assign clear=(!clock_con)&&(!t1)&&(t2);
endmodule
