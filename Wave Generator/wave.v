`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:47:20 02/07/2021
// Design Name:   waveGen
// Module Name:   D:/gotit/sinGen/wave.v
// Project Name:  sinGen
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: waveGen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module wave;

	// Inputs
	reg clk;
	reg [9:0] phase;

	// Outputs
	wire [9:0] X;
	wire [9:0] Y;

	// Instantiate the Unit Under Test (UUT)
	waveGen uut (
		.clk(clk), 
		.phase(phase), 
		.X(X), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		phase = 0;

		// Wait 100 ns for global reset to finish
		#100;
		phase = 10'h0000;
		repeat (5000)
		begin
		
		
		repeat (2)
			#10 clk = !clk;
      phase = phase + 10'b0000000001;
		end
		// Add stimulus here

	end
      
endmodule

