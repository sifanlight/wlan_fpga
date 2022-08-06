`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:36:06 01/04/2021
// Design Name:   scrambler
// Module Name:   C:/project/scrambler/tb.v
// Project Name:  scrambler
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: scrambler
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module scrambler_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [6:0] seed;
	reg data_in;

	// Outputs
	wire data_out;

	// Instantiate the Unit Under Test (UUT)
	scrambler uut (
		.clk(clk), 
		.reset(reset), 
		.seed(seed), 
		.data_in(data_in), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		seed = 0;
		data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		  reset = 1;
		  seed = 7'b0101001;
		  
		  #5 clk = 1;
		  #5 clk = 0;
		  reset = 0;
		  
		  data_in = 0;
		  repeat (7) 
			begin
				#5 clk = 1;
				#5 clk = 0;
			end
			data_in = 1;
			#5 clk = 1;
			#5 clk = 0;
			#5 clk = 1;
			#5 clk = 0;
			#5 clk = 1;
			#5 clk = 0;
			data_in = 0;
			#5 clk = 1;
			#5 clk = 0;
			data_in = 1;
			#5 clk = 1;
			#5 clk = 0;
			data_in = 0;
			#5 clk = 1;
			#5 clk = 0;
			#5 clk = 1;
			#5 clk = 0;

			
		// Add stimulus here

	end
      
endmodule

