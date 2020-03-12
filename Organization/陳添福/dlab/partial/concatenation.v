module concatenation(
    input [31:0] little_endian,
    output [31:0] big_edndian
    );
	 
assign big_edndian =
    {little_endian[7:0],
     little_endian[15:8],
	 little_endian[23:16],
	 little_endian[31:24]};

endmodule
