`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:43:58 07/04/2018 
// Design Name: 
// Module Name:    counter_all 
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
module counter_all(
    input clock_text,
    input clear,
    input enable,
    output [3:0] led_1,
    output [3:0] led_2,
    output [3:0] led_3,
    output [3:0] led_4,
    output [3:0] led_5,
    output [3:0] led_0
    );
/////////////////////////////////
wire c_out_0,c_out_1,c_out_2,c_out_3,c_out_4,c_out_5,c_out_6;
///////////////////////////////////
counter_one U3 (clock_text,clear,enable,c_out_0,led_0);
counter_one U4 (clock_text,clear,c_out_0,c_out_1,led_1);
counter_one U5 (clock_text,clear,c_out_1,c_out_2,led_2);
counter_one U6 (clock_text,clear,c_out_2,c_out_3,led_3);
counter_one U7 (clock_text,clear,c_out_3,c_out_4,led_4);
counter_one U8 (clock_text,clear,c_out_4,c_out_5,led_5);

endmodule
