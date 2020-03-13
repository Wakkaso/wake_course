`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:01:38 03/11/2020 
// Design Name: 
// Module Name:    mux_2to1 
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
module mux_2to1(
    input sel,
    input input_A,
    input input_B,
    output reg output_Z
    );
	always@(sel,input_A,input_B)
	begin
		if(!sel)//sel=0 output_Z=input_A
			output_Z = input_A;
		else //sel=1 output_Z=input_B
			output_Z = input_B;
	end
endmodule
