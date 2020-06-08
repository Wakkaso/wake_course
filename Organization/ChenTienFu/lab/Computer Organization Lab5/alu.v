/***************************************************
Student Name:
Student ID:
***************************************************/
`timescale 1ns/1ps

module alu(
	input	       rst_n,         // Reset                     (input)
	input	[31:0] src1,          // 32 bits source 1          (input)
	input	[31:0] src2,          // 32 bits source 2          (input)
	input 	[ 3:0] ALU_control,   // 4 bits ALU control input  (input)
	output  [31:0] result,        // 32 bits result            (output)
	output         zero,          // 1 bit when the output is 0, zero must be set (output)
	output         cout,          // 1 bit carry out           (output)
	output         overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */




endmodule
