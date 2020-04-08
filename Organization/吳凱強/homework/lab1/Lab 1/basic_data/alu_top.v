`timescale 1ns/1ps

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               equal,      //1 bit equal    (input)
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
input         equal;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output reg    result;
output wire   cout;

parameter ALU_AND  = 2'b00;
parameter ALU_OR   = 2'b01;
parameter ALU_ADD  = 2'b10;
parameter ALU_SET  = 2'b11;

wire a, b;
wire sum, out, comp_out;

assign a = A_invert^src1;
assign b = B_invert^src2;
compare COM(less, equal, comp, comp_out);
assign {sout, sum} = a+b+cin;
assign cout = ((operation==ALU_ADD)||(operation==ALU_SET)) ? sout : 1'b0;
always@( * )
begin 
    case(operation)
        ALU_AND: result <= a&b;
        ALU_OR: result <= a|b;
        ALU_ADD: result <= sum;
        ALU_SET: result <= comp_out;
        default: result <= 1'b0;
    endcase
end

endmodule
