`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:19 03/09/2020 
// Design Name: 
// Module Name:    d_flipflop 
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
module d_flipflop(
    input clk,
    input reset,
    input d_in,
    output reg d_out
    );
	 
	
	always@(posedge clk or posedge reset)begin
		if(reset)begin
			d_out<=1'b0;
		end
		else begin
			d_out<=d_in;
		end
	end

endmodule
