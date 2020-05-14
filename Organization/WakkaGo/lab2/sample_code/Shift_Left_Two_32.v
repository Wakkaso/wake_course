// Author: 0716055 王耀德  0716045 彭敍溶

module Shift_Left_Two_32(
    data_i,
    data_o
    );

//I/O ports
input [32-1:0] data_i;
output [32-1:0] data_o;

wire [31:0] data_o;

assign data_o[31:2] = data_i[29:0];
assign data_o[1] = 0;
assign data_o[0] = 0;

endmodule
