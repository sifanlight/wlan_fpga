`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:56 02/06/2021 
// Design Name: 
// Module Name:    serialToVector 
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
module serialToVector( input bitIn,
							  input clk,
							  input reset,
							  input [3:0]rate,
							  output reg [1:0]vecOut,
							  output reg done
    );

	reg [1:0] counter;
	reg m;
	
	always @(posedge clk)
	begin
		if (reset)
		begin
			counter <= 0;
			done = 0;
		end
		else
			begin
				case (counter)
					2'b00 : begin
									m = bitIn;
									done = 0;
									counter <= 2'b01;
							  end
					2'b01 : begin
									vecOut = {bitIn, m};
									done = 1'b1;
									counter <= 2'b10;
							  end
					2'b10 : begin
									if ( rate == 4'b1001)
									begin
										vecOut = {1'b0, bitIn};
										done = 1'b1;
										counter <= 2'b00;
									end
									else
									begin
										m = bitIn;
										done = 0;
										counter <= 2'b11;
									end
							  end
					2'b11 : begin
									vecOut = {bitIn, m};
									done = 1'b1;
									counter <= 2'b00;
							  end
				endcase 
			end
	end

endmodule
