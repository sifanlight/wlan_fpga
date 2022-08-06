`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:34 01/04/2021 
// Design Name: 
// Module Name:    scrambler 
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
module scrambler(
    input clk,
    input reset,
    input [6:0] seed,
    input data_in,
    output reg data_out
    );

    reg [6:0]x;
    reg temp;
    always @(posedge clk)
    begin
        if (reset)
			begin
            x <= seed;
			end
        else
            begin
                temp = x[6]^x[3];
                data_out = data_in^x[0];
                x <= x<<1 ;
                x[0] <= temp;
            end

    end


endmodule
