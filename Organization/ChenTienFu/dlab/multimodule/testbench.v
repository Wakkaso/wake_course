`timescale 1ns/1ps

module testbench();

reg         reset_n;
reg         clk_n;
reg         sel;
reg   [3:0] input1;
reg   [3:0] input2;

wire  [7:0] selected;

add_or_multiply demo(
    .reset_n(reset_n),
    .clk_i(clk_n),
	.sel(sel),
	.input1(input1),
	.input2(input2),
	.selected(selected)
);

parameter           CYCLE = 10;
always #(CYCLE/2.0) clk_n = ~clk_n;

initial begin

clk_n = 1;
reset_n = 1;
input1 = 4'd5;
input2 = 4'd3;

$dumpfile("testbench.vcd");
$dumpvars( 0, demo );

# 10
reset_n = 0;

# 10
reset_n = 1;
sel = 2'b00;

# 20
sel = 2'b01;

# 15
input1 = 4'd4;
input2 = 4'd7;

# 20
sel = 2'b00;

# 20
sel = 2'b01;

# 20

$finish;
end
endmodule
