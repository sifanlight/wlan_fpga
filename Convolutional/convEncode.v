`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:12 02/07/2021 
// Design Name: 
// Module Name:    convEncode 
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
module convEncode( input clk,
						 input reset,
						 input bitIn,
						 input re,
						 input [3:0]rate,
						 output outBit
    );
	 
	 reg [5:0]state;
	 reg [1:0]bitOut;
	 reg done;
	 always @(posedge clk)
		begin
			if (reset)
				begin
					bitOut[0] = bitIn^state[1]^state[2]^state[4]^state[5];
					bitOut[1] = bitIn^state[0]^state[1]^state[2]^state[5];
					done = 1'b1;
					state = state << 1;
					state[0] = bitIn;
				end
			else
				begin
					state = 6'd0;
					done = 1'b0;
				end
		end

memEnc instance_name (
    .bitIn(bitOut), 
    .rate(rate), 
    .clk(clk), 
    .reset(reset), 
    .we(done), 
    .re(re), 
    .bitOut(outBit)
    );


endmodule
