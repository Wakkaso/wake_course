`timescale 1ns/1ps

module testbench();

reg         reset_n;
reg         clk_n;
reg   [1:0] sel;
reg   [3:0] input1;
reg   [3:0] input2;
reg   [3:0] input3;
reg   [3:0] input4;
wire  [3:0] selected;

multiplexer test(
    .sel(sel),
	.input1(input1),
	.input2(input2),
	.input3(input3),
	.input4(input4),
    .selected(selected)
);

initial begin

$dumpfile("testbench.vcd");
$dumpvars( 0, test );

input1 = 4'd1;
input2 = 4'd2;
input3 = 4'd3;
input4 = 4'd4;

# 20
sel = 2'b00;

# 20
sel = 2'b01;

# 20
sel = 2'b10;

# 20
sel = 2'b11;

# 40

$finish;
end
endmodule
