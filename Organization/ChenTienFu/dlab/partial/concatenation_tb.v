`timescale 1ns / 1ps
module concatenation_tb;

	// Inputs
	reg [31:0] little_endian;

	// Outputs
	wire [31:0] big_edndian;

	// Instantiate the Unit Under Test (UUT)
	concatenation uut (
		.little_endian(little_endian), 
		.big_edndian(big_edndian)
	);

	initial begin
	
	    $dumpfile("testbench.vcd");
		$dumpvars( 0, uut );
	
		little_endian = 0;
		#50;
        little_endian = 32'h12345678 ;
		#50;
		little_endian = 32'h87654321 ;
		#100;
		$finish;

	end
      
endmodule

