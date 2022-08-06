`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:41 01/28/2021 
// Design Name: 
// Module Name:    h 
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


module perm1(
		input [288:0]m,
		input [7:0]Ncbps,
	//	input  clk,
	//	input reset,
		output  [288:0] out

);
		//reg [8:0]i;
		wire [288:0]mm;
		wire [7:0]Nbpsc;
		wire [7:0]s;
	/*	always @(posedge clk)
			begin
				mm = 0;
				for (i = 0; i <Ncbps; i = i +1'b1)
					begin
						mm[(Ncbps/5'd16)*(i%5'd16)+ (i/5'd16)] = m[i];
					end
				out = 0;
				Nbpsc = Ncbps / 16;
				s = (Nbpsc/2)>1 ? Nbpsc/2 : 1;
				for (i = 0; i <Ncbps; i = i +1'b1)
					begin
						out[s*(i/s)+((i+Ncbps-(5'd16*i/Ncbps))%s)] = mm[i];
					end
			end	*/

		assign Nbpsc = Ncbps >> 4;
		assign s = (Nbpsc>>1)>1 ? Nbpsc>>1 : 1;
		
		genvar i;
		generate
		for (i = 0; i <Ncbps; i = i +1'b1)
					begin : interleaving_1
						assign mm[(Ncbps/5'd16)*(i%5'd16)+ (i/5'd16)] = m[i];
					end
		for (i = 0; i <Ncbps; i = i +1'b1)
					begin:interleaving_2
						assign out[s*(i/s)+((i+Ncbps-(5'd16*i/Ncbps))%s)] = mm[i];
					end
		endgenerate

endmodule

/*
module perm2(
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
						out[(Ncbps/5'd16)*(i%5'd16)+ (i/5'd16)] = m[i];
					end
			end

endmodule
*/
