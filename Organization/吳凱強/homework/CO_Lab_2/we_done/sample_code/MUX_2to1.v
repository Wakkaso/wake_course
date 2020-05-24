// Author: 0716055 王耀德  0716045 彭敍溶

module MUX_2to1(
    data0_i,
    data1_i,
    select_i,
    data_o
    );

parameter size = 0;           // modify the size

//I/O ports
input   [size-1:0] data0_i;
input   [size-1:0] data1_i;
input              select_i;
output  [size-1:0] data_o;

//Internal Signals
reg     [size-1:0] data_o;

always @(*)
begin
  if (select_i)
      data_o = data1_i;
  else
      data_o = data0_i;
end

endmodule
