`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:10 02/07/2021 
// Design Name: 
// Module Name:    waveGen 
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
module waveGen(input clk,
					input [9:0] phase,
					output [9:0]X,
					output [9:0]Y
    );
	
	dds your_instance_name (
  .clk(clk), // input clk
  .phase_in(phase), // input [15 : 0] phase_in
  .cosine(X), // output [15 : 0] cosine
  .sine(Y) // output [15 : 0] sine
);
	/*
	sinGen your_instance_name (
  .phase_in(phase), // input [15 : 0] phase_in
  .x_out(X), // output [15 : 0] x_out
  .y_out(Y), // output [15 : 0] y_out
  .clk(clk) // input clk
  );
  */
endmodule
