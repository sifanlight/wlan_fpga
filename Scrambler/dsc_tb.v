`timescale 1ns / 1ps
module dsc_ttb;

reg clk;
integer data_file;
integer scan_file;
integer i, j, flag;
reg [6:0]data;
reg [6:0]s_out;
reg [6:0]ans;
reg reset;
reg data_in;
wire data_out;

initial begin
	data_file = $fopen("test.txt", "r");
	flag = 0;
	for (j = 0; j <19; j = j+1)
	begin
	clk = 0;
	reset = 1;
	$fscanf(data_file, "%7b\n", ans);
	$fscanf(data_file, "%7b\n", data);
	#10 clk = 1;
	#10 clk = 0;
	reset = 0;
	//----------
	data_in = 1;
	#10 clk = 1;
	#10 clk = 0;
	#10 clk = 1;
	#10 clk = 0;
	#10 clk = 1;
	#10 clk = 0;
	data_in = 0;
	#10 clk = 1;
	#10 clk = 0;
	#10 clk = 1;
	#10 clk = 0;
	data_in = 1;
	#10 clk = 1;
	#10 clk = 0;
	#10 clk = 1;
	#10 clk = 0;
	for (i = 0; i < 7; i = i + 1)
		begin
			data_in = data[i];
			#10 clk = 1;
			#10 clk = 0;
			s_out[i] = data_out;
		end
	#10 clk = 1;
	#10 clk = 0;
	if (ans == s_out)
		$display("YES");
	else
		begin
			$display("NO");
			flag = 1;
		end
	end
	
	if (flag)
		$display("The module is not working correctly");
	else
		$display("The module is working correctly");
	$stop;
end 

descrambler uut(
.clk(clk),
.reset(reset),
.data_in(data_in),
.data_out(data_out)
);
endmodule
