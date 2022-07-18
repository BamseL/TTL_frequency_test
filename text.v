`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:34:43 07/04/2018
// Design Name:   HZV
// Module Name:   D:/ISE_project/HZV/text.v
// Project Name:  HZV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HZV
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module text;

	// Inputs
	reg clock;
	reg reset;
	reg clock_text;

	// Outputs
	wire D1;
	wire D2;
	wire [3:0] N;
	wire [7:0] L;

	// Instantiate the Unit Under Test (UUT)
	HZV uut (
		.clock(clock), 
		.reset(reset), 
		.clock_text(clock_text), 
		.D1(D1), 
		.D2(D2), 
		.N(N), 
		.L(L)
	);

	initial begin
		// Initialize Inputs
		reset = 0;

		// Wait 100 ns for global reset to finish
		#1000000 reset=1;
		#1000000 reset=0;
	end
	always 
	  begin
	    #10 clock=0;
	    #10 clock=1;
	  end
   always
	  begin
	    #500000 clock_text=0;
	    #500000 clock_text=1;
	  end
endmodule

