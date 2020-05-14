// Author: 0716055 王耀德  0716045 彭敍溶

module Decoder(
    instr_op_i,
    RegWrite_o,
    ALU_op_o,
    ALUSrc_o,
    RegDst_o,
    Branch_o
    );

//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;

//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;

always @ (*) 
begin
    case(instr_op_i)
        6'b000000: ALU_op_o = 3'b000;
        6'b001000: ALU_op_o = 3'b001;
        6'b001011: ALU_op_o = 3'b010;
        6'b000100: ALU_op_o = 3'b011;
        6'b001111: ALU_op_o = 3'b100;
        6'b001101: ALU_op_o = 3'b101;
        6'b000101: ALU_op_o = 3'b110;
    endcase
end

always @ (*)
begin
    if(instr_op_i == 6'b000100 || instr_op_i == 6'b000101)
        Branch_o = 1;
    else
        Branch_o = 0;
end

always @(*)
begin
    if(instr_op_i == 6'b000100 || instr_op_i == 6'b000101)
        RegWrite_o = 0;
    else
        RegWrite_o = 1;
end

always @ (*)
begin
    if(instr_op_i[5:3] == 3'b000)
        ALUSrc_o = 0;
    else
        ALUSrc_o = 1;
end

always @ (*)
begin
    if(instr_op_i == 6'b000000)
        RegDst_o = 1;
    else
        RegDst_o = 0;
end 

endmodule

