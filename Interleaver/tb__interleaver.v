`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:13:14 01/28/2021
// Design Name:   perm1
// Module Name:   E:/project/divide/asd.v
// Project Name:  divide
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: perm1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module asd;

	// Inputs
	reg [288:0] m;
	reg [7:0] Ncbps;
	reg clk;
	reg reset;

	// Outputs
	wire [288:0] out;

	// Instantiate the Unit Under Test (UUT)
	perm1 uut (
		.m(m), 
		.Ncbps(Ncbps), 
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		m = 0;
		Ncbps = 8'd192;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
      m = 192'h4dd7cb079807c203ce1303f14317df52b859adb90f8510d4;
		//m = 32'h00030023;
		clk = 1;
		#100;
		clk = 0;
		$display(out);
		
		// Add stimulus here

	end
      
endmodule

