`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:06 02/06/2021 
// Design Name: 
// Module Name:    minCost 
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
module minCost( input [447:0]costs,
					 input clk,
					 input dataReady,
					 output [5:0] index,
					 output reg done
    );
	 
	 reg [2:0]counter;
	 wire [5:0] in1[0:31];		//32
	 wire [5:0] in2[0:15];		//16
	 wire [5:0] in3[0:7];		//8
	 wire [5:0] in4[0:3];		//4	
	 wire [5:0] in5[0:1];		//2
	 
//	 wire [5:0] out1[0:31];		//32
	 wire [6:0] value1 [0:31];
	 
//	 wire [5:0]  out2[0:15];		//16
	 wire [6:0] value2 [0:15];
	 
//	 wire [5:0]  out3[0:7];		//8
	 wire [6:0] value3 [0:7];
	 
//	 wire [5:0]  out4[0:3];		//4	
	 wire [6:0] value4 [0:3];
	 
//	 wire [5:0]  out5[0:1];		//2
	 wire [6:0] value5 [0:1];
	 
	 always @(posedge clk)
		begin
			if (dataReady)
				begin
					counter = counter + 1'b1;
					if (counter == 3'b110)
						done = 1'b1;
				end
			else
				begin
					counter = 0;
					done = 1'b0;
				end
		end
		
		
		
		genvar i;
		generate 
			for (i = 0; i < 32; i = i + 1) begin: comparators_32
				assign in1[i] = costs[(2*(i+1))*7-1:(2*(i+1)-1)*7] > costs[(2*(i+1)-1)*7-1:2*i*7]? 2*(i+1)-1 : 2*i;
				assign value1[i] = costs[(2*(i+1))*7-1:(2*(i+1)-1)*7] > costs[(2*(i+1)-1)*7-1:2*i*7]? costs[(2*(i+1))*7-1:(2*(i+1)-1)*7] : costs[(2*(i+1)-1)*7-1:2*i*7];
			end
			
			for (i = 0; i < 16; i = i + 1) begin: comparators_16
				assign in2[i] =  value1[(2*i)+1] > value1[2*i] ? in1[(2*i)+1] : in1[2*i];
				assign value2[i] = value1[(2*i)+1] > value1[2*i] ? value1[(2*i)+1] :value1[2*i];
			end
			
			for (i = 0; i < 8; i = i + 1) begin: comparators_8
				assign in3[i] =  value2[(2*i)+1] > value2[2*i] ? in2[(2*i)+1] : in2[2*i];
				assign value3[i] = value2[(2*i)+1] > value2[2*i] ? value2[(2*i)+1] :value2[2*i];
			end
			
			for (i = 0; i < 4; i = i + 1) begin: comparators_4
				assign in4[i] =  value3[(2*i)+1] > value3[2*i] ? in3[(2*i)+1] : in3[2*i];
				assign value4[i] = value3[(2*i)+1] > value3[2*i] ? value3[(2*i)+1] :value3[2*i];
			end
			
			for (i = 0; i < 2; i = i + 1) begin: comparators_2
				assign in5[i] =  value4[(2*i)+1] > value4[2*i] ? in4[(2*i)+1] : in4[2*i];
				assign value5[i] = value4[(2*i)+1] > value4[2*i] ? value4[(2*i)+1] :value4[2*i];
			end
		endgenerate
		
		assign index = value5[0] > value5[1] ? in5[0] : in5[1];
				
endmodule
