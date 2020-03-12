`timescale 1ns/1ps

module testbench();

reg         reset_n;
reg         clk_n;
reg   [1:0] num;
wire  [3:0] exp;

exponential test(
    .reset_n( reset_n ),
    .clk_i( clk_n ),
    .num( num ),
    .exp( exp )
);

parameter           CYCLE = 10;
always #(CYCLE/2.0) clk_n = ~clk_n;

initial begin

clk_n = 1;
reset_n = 1;

$dumpfile("testbench.vcd");
$dumpvars( 0, test );

# 10
reset_n = 0;

# 10
reset_n = 1;

# 20
num = 2'b00;

# 20
num = 2'b01;

# 20
num = 2'b10;

# 20
num = 2'b11;

# 40

$finish;
end
endmodule
