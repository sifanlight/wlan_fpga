`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:39 02/07/2021 
// Design Name: 
// Module Name:    pathMemory 
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
module pathMemory(input [63:0]decisions,
						input clk,
						input memRst,
						input we,
						input re,
						output reg [63:0]memOut,
						output reg ready
    );
	 
	 reg [63:0]pathMem[0:31];
	 reg [4:0] counter;
	 
	 always @(posedge clk)
		begin
			if (memRst)
				begin
					if (we)
						begin
							pathMem[counter] = decisions;
							counter = counter + 1'b1;
						end
					if (re)
						begin
							memOut = pathMem[counter];
							if (counter != 5'd0)
								counter = counter - 1'b1;
							else
								counter = 5'd0;
						end
					if (&counter == 1'b1)
						ready = 1'b1;
				end
			else
				begin
					counter = 5'd0;
					ready = 1'b0;
				end
		end


endmodule
