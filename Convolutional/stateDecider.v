`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:05 02/06/2021 
// Design Name: 
// Module Name:    stateDecider 
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
module stateDecider(input [6:0]cost1,
						  input [6:0]cost0,
						  input [1:0]mcost1,
						  input [1:0]mcost0,
						  output [6:0] cost,
						  output decision
    );
	 
	 wire [6:0] sum1, sum0;
	 assign sum1 = cost1 + mcost1;
	 assign sum0 = cost0 + mcost0;
	 assign decision = sum0 > sum1 ? 1'b0 : 1'b1;
	 assign cost = decision ? sum1 : sum0;

endmodule
