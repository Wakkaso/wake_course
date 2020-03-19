`timescale 1ns/1ps

module testbench();

reg   [6:0] A;
reg   [6:0] B;
reg  [13:0] C;
reg         reset_n;
reg         clk_n;
wire [14:0] output_reg;

counter1 test (
    .clk_n( clk_n ),
    .reset_n( reset_n ),
    .A( A ),
    .B( B ),
    .C( C ),
    .count( output_reg )
);

parameter           CYCLE = 10;
always #(CYCLE/2.0) clk_n = ~clk_n;

initial begin

clk_n = 1;
reset_n = 1;
A = 7'd40;
B = 7'd20;
C = 14'd1234;

$dumpfile("testbench.vcd");
$dumpvars( 0, test );

# 10
reset_n = 0;

# 10
reset_n = 1;

# 30
$finish;


end



endmodule
