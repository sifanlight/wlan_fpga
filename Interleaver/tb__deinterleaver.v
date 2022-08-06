`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:54:53 01/29/2021
// Design Name:   dd
// Module Name:   E:/project/divide/qqqq.v
// Project Name:  divide
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module qqqq;

	// Inputs
	reg [288:0] m;
	reg [7:0] Ncbps;
	reg clk;
	reg reset;

	// Outputs
	wire [288:0] out;

	// Instantiate the Unit Under Test (UUT)
	dd uut (
		.m(m), 
		.Ncbps(Ncbps), 
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		m = 0;
		Ncbps = 8'd32;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
      m = 32'h040f;
		clk = 1;
		#100;
		clk = 0;
		$display(out);
		end
      
endmodule

