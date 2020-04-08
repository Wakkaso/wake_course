`timescale 1ns/1ps

module alu_bottom(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               equal,      //1 bit equal    (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               comp,       //compare        (input)
               result,     //1 bit result   (output)
               set,         //1 bit set      (output)
               less_out
               );

input         src1;
input         src2;
input         less;
input         equal;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;
input [3-1:0] comp;

output reg    result;
output wire   set, less_out;

parameter ALU_AND  = 2'b00;
parameter ALU_OR   = 2'b01;
parameter ALU_ADD  = 2'b10;
parameter ALU_SET  = 2'b11;

wire a, b;
wire sum, sout;

assign a = A_invert^src1;
assign b = B_invert^src2;
//compare COM(less, equal, comp, comp_out);
assign {sout, sum} = a+b+cin;
assign less_out = sum;
assign set = ((operation==ALU_ADD)||(operation==ALU_SET)) ? sout : 1'b0;

always@( * )
begin 
    case(operation)
        ALU_AND: result <= a&b;
        ALU_OR: result <= a|b;
        ALU_ADD: result <= sum;
        ALU_SET: result <= 1'b0;
        default: result <= 1'b0;
    endcase
end

endmodule
