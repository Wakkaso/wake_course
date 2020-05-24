`timescale 1ns/1ps

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout       //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output        result;
output        cout;

reg           result, cout;

wire a, b;
wire sum, sout;
assign a = A_invert == 1'b1 ? ~src1 : src1;
assign b = B_invert == 1'b1 ? ~src2 : src2;
assign {sout, sum} = a+b+cin;
always@( * )
begin 
    case(operation)
        2'b00: result <= a&b;
        2'b01: result <= a|b;
        2'b10: result <= sum;
        2'b11: result <= (~(a==b))&(less);
        default: result <= 1'b0;
    endcase
    cout <= sout;
end

endmodule
