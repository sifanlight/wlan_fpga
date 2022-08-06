`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:10 02/06/2021 
// Design Name: 
// Module Name:    branchMetric 
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
module branchMetric(input [1:0]vecBits,
						  input clk,
						  input dataReady,
						  input [3:0]rate,
						  output reg [7:0]metrics,
						  output reg done
    );

		always @(posedge clk)
		begin 
			if (dataReady)
				begin
					if (rate == 4'b1001)
						begin
							metrics[1:0] = (2'b00) ^ {1'b0,vecBits[0]};
							metrics[3:2] = (2'b01) ^ {1'b0,vecBits[0]};
							metrics[5:4] = (2'b10) ^ {1'b1,vecBits[0]};
							metrics[7:6] = (2'b11) ^ {1'b1,vecBits[0]};
						end
					else
						begin
							metrics[1:0] = (2'b00) ^ vecBits;
							metrics[3:2] = (2'b01) ^ vecBits;
							metrics[5:4] = (2'b10) ^ vecBits;
							metrics[7:6] = (2'b11) ^ vecBits;
						end
					done = 1'b1;
							
				end
			else
				done = 1'b0;
		end

endmodule
