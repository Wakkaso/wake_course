`timescale 1ns/1ps

module testbench();

reg         reset_n;
reg         clk_n;
reg         set_n;
reg   [7:0] load;
wire  [7:0] output_reg;

example1 test(
    .reset_n(reset_n),
    .clk_i(clk_n),
    .set_n(set_n),
    .load(load),
    .count(output_reg)
);

parameter           CYCLE = 10;
always #(CYCLE/2.0) clk_n = ~clk_n;

initial begin

clk_n = 1;
reset_n = 1;
set_n = 1;

$dumpfile("testbench.vcd");
$dumpvars( 0, test );

# 10
reset_n = 0;

# 10
reset_n = 1;

# 20
set_n = 0;
load = 8'd58;

# 10
set_n = 1;

# 50
set_n = 0;
load = 8'd32;

# 20
set_n = 1;

$finish;
end
endmodule
