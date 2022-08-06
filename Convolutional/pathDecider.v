`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:39 02/06/2021 
// Design Name: 
// Module Name:    pathDecider 
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
module pathDecider(input [7:0] metrics,
						 input clk,
						 input reset,
						 input dataReady,
						 output [63:0]decisions,
						 output [447:0] costs,
						 output reg done
							
    );
			reg [447:0]pathCost;
			wire [447:0]tempCost;
			
			assign costs = pathCost;
			
			always @(posedge clk)
			begin
				if (reset)
					pathCost = 448'd0;
				else
					begin
						if (dataReady)
							begin
									done = 1'b1;
									pathCost = tempCost;
								
								
							end
						else
							done = 1'b0;
					end
			end
			//-----------
			genvar i;
	
			generate 
				for (i = 0; i < 64; i = i + 1) begin : deciders
						stateDecider sd (
							.cost1(pathCost[{1'b1,i[5:1]}*7+6:{1'b1,i[5:1]}*7]), 
							.cost0(pathCost[{1'b0,i[5:1]}*7+6:{1'b0,i[5:1]}*7]), 
							.mcost1(metrics[{i[0]^i[1]^i[2]^i[3]^1'b1,i[0]^i[2]^i[3]^i[5]^1'b1}*2+1:{i[0]^i[1]^i[2]^i[3]^1'b1,i[0]^i[2]^i[3]^i[5]^1'b1}*2]), 
							.mcost0(metrics[{i[0]^i[1]^i[2]^i[3]^1'b1,i[0]^i[2]^i[3]^i[5]^1'b0}*2+1:{i[0]^i[1]^i[2]^i[3]^1'b1,i[0]^i[2]^i[3]^i[5]^1'b0}*2]), 
							.cost(tempCost[i*7+6:i*7]), 
							.decision(decisions[i])
						);

					end
			endgenerate
	
endmodule
