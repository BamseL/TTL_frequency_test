`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:28 07/04/2018 
// Design Name: 
// Module Name:    HZV 
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
module HZV(
    input clock,
    input reset,
    input clock_text,
    output D1,
    output D2,
    output [3:0] N,
    output [7:0] L
    );
/////////////////////////////////////
wire clock_con_t,clock_led_t,clear_t,enable_t,latch_t,D1_t,D2_t,DP_1_t,DP_2_t,DP_3_t,
       clock_t,clock_text_t,reset_t ;
wire [3:0] led_0_t,led_1_t,led_2_t,led_3_t,led_4_t,led_5_t,led_6_t,latch_0_t,latch_1_t,latch_2_t,
       latch_3_t,N_t ;
wire [7:0] L_t ;
///////////////////////////////////////
assign clock_t=clock;
assign clock_text_t=clock_text;
assign reset_t=reset;
two_clk T1 (clock_t,reset_t,clock_con_t,clock_led_t);
contro T2 (clock_con_t,reset_t,clear_t,enable_t,latch_t);
counter_all T3 (clock_text_t,clear_t,enable_t,led_1_t,led_2_t,led_3_t,led_4_t,led_5_t,
                        led_0_t);
latch T4 (latch_t,D1_t,D2_t,DP_1_t,DP_2_t,DP_3_t,
                 led_0_t,led_1_t,led_2_t,led_3_t,led_4_t,led_5_t,
                 latch_0_t,latch_1_t,latch_2_t,latch_3_t);
seg T5 (clock_led_t,latch_0_t,latch_1_t,latch_2_t,latch_3_t,DP_1_t,DP_2_t,DP_3_t,
                 L_t,N_t);					  
/////////////////////////////////
assign D1=D1_t;
assign D2=D2_t;
assign L=L_t;
assign N=N_t;

endmodule
