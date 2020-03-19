module add_or_multiply(
    input        reset_n,
    input        clk_i,
	input        sel,
	input  [3:0] input1,
	input  [3:0] input2,
	output [7:0] selected
);

wire [7:0] added;
wire [7:0] multiplied;

adder add(
    .reset_n(reset_n),
    .clk_i(clk_i),
	.input1(input1),
	.input2(input2),
	.added(added)
);

multiplier multiply(
    .reset_n(reset_n),
    .clk_i(clk_i),
	.input1(input1),
	.input2(input2),
	.multiplied(multiplied)
);

mux mux(
    .reset_n(reset_n),
    .clk_i(clk_i),
    .sel(sel),
	.input1(added),
	.input2(multiplied),
    .result(selected)
);

endmodule