`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:59 02/07/2021 
// Design Name: 
// Module Name:    memEnc 
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
module memEnc( input [1:0]bitIn,
					input [3:0]rate, 
					input clk,
					input reset,
					input we,
					input re,
					output reg bitOut
    );
	 
	 reg [4095:0] m;
	 reg  [11:0]wcounter, rcounter;
	 always @(posedge clk)
		begin
			if (reset)
				begin
						if (we == 1'b1)	
							begin
								if (rate == 4'b1001)
									begin
										m[wcounter] = bitIn[0];
										wcounter = wcounter + 1'b1;
									end
								else
									begin
										m[wcounter] = bitIn[0];
										wcounter = wcounter + 1'b1;
										m[wcounter] = bitIn[1];
										wcounter = wcounter + 1'b1;
									end
							end
						if (re == 1'b1)
							begin
								bitOut= m[rcounter];
								rcounter = rcounter + 1'b1;
							end
								
				end
			else
				begin	
					rcounter = 0;
					wcounter = 0;
				end
		end


endmodule
