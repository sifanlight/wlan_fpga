`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:47 02/07/2021 
// Design Name: 	
// Module Name:    restoreBits 
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
module restoreBits(input [63:0] decisions,
						 input clk,
						 input [5:0]minCost,
						 input dataReady,
						 output reg[31:0] bitOut,
						 output reg done
    );
	 
	 reg [4:0] counter;
	 reg [5:0] state;
	 reg stateBit;
	 //reg [31:0] bits
	 always @(posedge clk)
		begin
			if (dataReady)
				begin
					stateBit = decisions[state];
					bitOut[counter] = state[0];
					state = state>>1'b1;
					state[5] = stateBit;
					
					if (counter == 5'd0)
						done = 1'b1;
					counter = counter - 1'b1;
				end
			else
				begin
					done = 1'b0;	
					state = minCost;
					counter = 5'b11111;
				end
		end	


endmodule
