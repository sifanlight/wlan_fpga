`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:16 01/04/2021 
// Design Name: 
// Module Name:    descrambler 
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
module descrambler(
    input clk,
    input reset,
    input data_in,
    output reg data_out
    );
	 reg state;
	 reg [6:0]x;
	 reg [2:0]counter;
	 reg temp;
	 always @(posedge clk)
	 begin
			if (reset)
				begin
					counter <= 4'd0;
					x <= 7'd0;
					state <= 1'b1;
				end
			else
				begin
					if (state)
						begin
							
							if (counter == 3'b110)
								begin
									x[counter] <= data_in;
									/*x <= x<<1 ;
									temp = data_in^x[3];
									x[0] <= temp;*/
									counter <= 0;
									state <= 1'b0;
								end
							else
								begin
									x[counter] <= data_in;
									counter <= counter + 1'b1;
								end
						end
					else
						begin
							temp = x[6]^x[3];
							data_out = x[0]^data_in;
							x<= x<<1;
							x[0] <= temp;
						end
				end
	 end


endmodule
