`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:48:32 01/29/2021 
// Design Name: 
// Module Name:    dd 
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

module dd(
		input [288:0]m,
		input [7:0]Ncbps,
		input  clk,
		input reset,
		output reg [288:0] out

);
		reg [8:0]i;
		always @(posedge clk)
			begin
				out = 0;
				for (i = 0; i <Ncbps; i = i +1'b1)
					begin
						out[5'd16*i - ((Ncbps - 1'b1)*((5'd16*i/Ncbps)))] = m[i];
					end
			end

endmodule


