`timescale 1ns / 1ps
module lfsr_tb;
	// Inputs
	reg clk;
	reg reset;
	reg load;
	reg [3:0] seed;
	// Outputs
	wire [3:0] result;
	// Instantiate the Unit Under Test (UUT)
	lfsr uut (
		.clk(clk), 
		.reset(reset), 
		.load(load), 
		.seed(seed), 
		.result(result)
	);

	initial begin 
	reset = 0;
	#10 reset = 1; // reset pulse
	#10 reset = 0;
	end
	
	initial clk = 0;
	always #50 clk = !clk; // generate clock
	
	initial begin
		load = 0;
		seed = 0;
		#100 seed = 4'b0001;
		load = 1;
		#100 load = 0;
	end
	  
	initial #2000 $finish;
	initial $monitor($realtime,"ns %h %h %h\n",load,seed,result);
endmodule
