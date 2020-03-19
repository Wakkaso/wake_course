`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:37:55 03/09/2020 
// Design Name: 
// Module Name:    lfsr 
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
module lfsr(
    input clk,
	 input reset,
	 input load,
	 input [3:0] seed,
    output wire [3:0] result
    );
	 
	wire d_in[3:0];

	wire feedback;
	
   mux_2to1 m0(
		.sel(load),  
		.input_A(feedback),
		.input_B(seed[0]),
		.output_Z(d_in[0])
    );
	 
	d_flipflop d0(
		 .clk(clk),
		 .reset(reset),
		 .d_in(d_in[0]),
		 .d_out(result[0])
		 );
		 
	mux_2to1 m1(
		.sel(load),  
		.input_A(result[0]),
		.input_B(seed[1]),
		.output_Z(d_in[1])
    );
	 
   d_flipflop d1(
		 .clk(clk),
		 .reset(reset),
		 .d_in(d_in[1]),
		 .d_out(result[1])
		 );
		 
   mux_2to1 m2(
		.sel(load),  
		.input_A(result[1]),
		.input_B(seed[2]),
		.output_Z(d_in[2])
    );
	 
   d_flipflop d2(
		 .clk(clk),
		 .reset(reset),
		 .d_in(d_in[2]),
		 .d_out(result[2])
		 );
		 
	mux_2to1 m3(
		.sel(load),  
		.input_A(result[2]),
		.input_B(seed[3]),
		.output_Z(d_in[3])
    );
	 
   d_flipflop d3(
		 .clk(clk),
		 .reset(reset),
		 .d_in(d_in[3]),
		 .d_out(result[3])
		 );
		 
	
	//assign d_in[0] = result[3] ^ result[2];
	xor G1(feedback, result[3], result[2]);//(dst,src1,src2,src...)
	
endmodule
