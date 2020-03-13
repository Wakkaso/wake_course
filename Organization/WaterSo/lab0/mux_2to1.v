`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:00:18 03/12/2020 
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
    output output_Z
    );

module mux_2to1(
    input sel,
    input input_A,
    input input_B,
    output reg output_Z
    );
	always@(*)begin
		if(!sel) begin//sel=0 output_Z=input_A
			output_Z = input_A;
		end
		else begin//sel=1 output_Z=input_B
			output_Z = input_B;
		end
	end

endmodule
