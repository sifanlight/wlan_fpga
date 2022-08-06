`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:17:23 02/07/2021 
// Design Name: 
// Module Name:    viterDecode 
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
module viterDecode(input bitIn,
						 inout clk,
						 input reset,
						 input [3:0]rate,
						 output [31:0]bitsOut,
						 output reg done,
						 output reg ready
    );
	 wire [1:0] vecOut;
     wire SVdone, BMdone, PDdone, MCdone, RBdone, memReady;
	  reg SVrst, memRst, PDrst;
	  reg re;
     wire [7:0] metrics;
     wire [63:0]decisions, memOut;
     wire [447:0]costs;
     wire [5:0]index;

	 
	 reg [5:0] counter;
	 always @(posedge clk)
		begin
			if (reset)
				begin
                    SVrst = 1'b1;
                    memRst = 1'b1;
                    PDrst = 1'b1;

                    if (counter < 6'b100000)
                        ready = 1'b1;
                    else
                        ready = 1'b0;
                    
                    if (SVdone == 1'b1)
                        counter <= counter + 1'b1;
                    else
                        counter <= counter;

                    if (MCdone == 1'b1)
                            re = 1'b1;
                    else 
                            re = 1'b0;
                    if (RBdone == 1'b1)
                        begin
                            done = 1'b1;
                        end
                    else
                        done = 1'b0;

					
				end
			else
				begin
					counter <= 6'd0;
					done = 1'b0;
					ready = 1'b0;
                    SVrst = 1'b0;
                    memRst = 1'b0;
                    PDrst = 1'b0;
				end
		end
	 
	 
	 
	 
	 serialToVector SV (
    .bitIn(bitIn), 
    .clk(clk), 
    .reset(SVrst), 
    .rate(rate), 				//4-bits
    .vecOut(vecOut),       //2-bits
    .done(SVdone)
    );
	 
	 branchMetric BM (
    .vecBits(vecOut), 		//2-bits
    .clk(clk), 
    .dataReady(SVdone), 
    .rate(rate), 				//4-bits
    .metrics(metrics), 		//8-bits
    .done(BMdone)
    );
	 
	 pathDecider PD (
    .metrics(metrics), 		//8-bits
    .clk(clk), 
    .reset(PDrst), 
    .dataReady(BMdone), 
    .decisions(decisions), //64-bits
    .costs(costs), 			//448-bits
    .done(PDdone)
    );
	 
	 pathMemory PM (
    .decisions(decisions), //64-bits
    .clk(clk), 
    .memRst(memRst), 
    .we(PDdone), 
    .re(re), 
    .memOut(memOut),        //64-bits
	 .ready(memReady)
    );
	 
	 minCost MC (
    .costs(costs), 			//448-bits
    .clk(clk), 
    .dataReady(memReady), 
    .index(index), 			//6-bits
    .done(MCdone)
    );

	 restoreBits RB (
    .decisions(memOut), //64-bits
    .clk(clk), 
    .minCost(index), 		//6-bits
    .dataReady(MCdone), 
    .bitOut(bitsOut), 		//32-bits
    .done(RBdone)
    );
	 


endmodule 
