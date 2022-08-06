`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:28:37 01/04/2021
// Design Name:   descrambler
// Module Name:   C:/project/scrambler/descrambler_tb.v
// Project Name:  scrambler
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: descrambler
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module descrambler_tb;

	// Inputs
	reg clk;
	reg reset;
	reg data_in;

	// Outputs
	wire data_out;

	// Instantiate the Unit Under Test (UUT)
	descrambler uut (
		.clk(clk), 
		.reset(reset), 
		.data_in(data_in), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#5 clk = 1;
		#5 clk = 0;
		reset = 0;
		data_in = 1'b1;
		#5 clk = 1;
		#5 clk = 0;
		#5 clk = 1;
		#5 clk = 0;
		#5 clk = 1;
		#5 clk = 0;
		data_in = 1'b0;
		#5 clk = 1;
		#5 clk = 0;
		#5 clk = 1;
		#5 clk = 0;
		data_in = 1;
		#5 clk = 1;
		#5 clk = 0;
		#5 clk = 1;
		#5 clk = 0;
		// ---------------------
		data_in = 0;
		#5 clk = 1;
		#5 clk = 0;
		#5 clk = 1;
		#5 clk = 0;
		data_in = 1;
		#5 clk = 1;
		#5 clk = 0;
		#5 clk = 1;
		#5 clk = 0;
		data_in = 0;
		#5 clk = 1;
		#5 clk = 0;
		#5 clk = 1;
		#5 clk = 0;
		data_in = 1;
		#5 clk = 1;
		#5 clk = 0;

	
		
        
		// Add stimulus here

	end
      
endmodule

