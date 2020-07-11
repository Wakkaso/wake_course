// Author: 0716055 王耀德  0716045 彭敍溶

module MUX_4to1(
    data0_i,
    data1_i,
    data2_i,
    data3_i,
    select_i,
    data_o
    );

parameter size = 0;           // modify the size

//I/O ports
input   [size-1:0] data0_i;
input   [size-1:0] data1_i;
input   [size-1:0] data2_i;
input   [size-1:0] data3_i;
input        [1:0] select_i;
output  [size-1:0] data_o;

//Internal Signals
reg     [size-1:0] data_o;

always @(*)
begin
  case(select_i)
  2'b00:
      data_o = data0_i;
  2'b01:
      data_o = data1_i;
  2'b10:
      data_o = data2_i;
  2'b11:
      data_o = data3_i;
  endcase
end

endmodule
