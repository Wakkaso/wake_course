`timescale 1ns/1ps

module alu(
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
		 //bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );


input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;
//input   [3-1:0] bonus_control; 

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
reg             zero;
reg             cout;
reg             overflow;

parameter ALU_AND  = 4'b0000;
parameter ALU_OR   = 4'b0001;
parameter ALU_ADD  = 4'b0010;
parameter ALU_SUB  = 4'b0110;
parameter ALU_NOR  = 4'b1100;
parameter ALU_NAND = 4'b1101;
parameter ALU_SET  = 4'b0111;

wire    [32-1:0] coArr, aresult;
wire    [2-1:0]  opcode;
assign a_invert = ( (ALU_control == ALU_NOR )||( ALU_control == ALU_NAND ) ) ? 1'b1 : 1'b0;
assign b_invert = ( (ALU_control == ALU_SUB )||( ALU_control == ALU_NOR )||( ALU_control == ALU_NAND )) ? 1'b1 : 1'b0;
assign top_cin = ( (ALU_control == ALU_SUB)||(ALU_control == ALU_NAND)) ? 1'b1 : 1'b0;

alu_top A1(src1[0], src2[0], coArr[31], a_invert, b_invert, top_cin, opcode, aresult[0], coArr[0]);
alu_top A2(src1[1], src2[1], 1'b0, a_invert, b_invert, coArr[1], opcode, aresult[1], coArr[1]);
alu_top A3(src1[2], src2[2], 1'b0, a_invert, b_invert, coArr[2], opcode, aresult[2], coArr[2]);
alu_top A4(src1[3], src2[3], 1'b0, a_invert, b_invert, coArr[3], opcode, aresult[3], coArr[3]);
alu_top A5(src1[4], src2[4], 1'b0, a_invert, b_invert, coArr[4], opcode, aresult[4], coArr[4]);
alu_top A6(src1[5], src2[5], 1'b0, a_invert, b_invert, coArr[5], opcode, aresult[5], coArr[5]);
alu_top A7(src1[6], src2[6], 1'b0, a_invert, b_invert, coArr[6], opcode, aresult[6], coArr[6]);
alu_top A8(src1[7], src2[7], 1'b0, a_invert, b_invert, coArr[7], opcode, aresult[7], coArr[7]);
alu_top A9(src1[8], src2[8], 1'b0, a_invert, b_invert, coArr[8], opcode, aresult[8], coArr[8]);
alu_top A10(src1[9], src2[9], 1'b0, a_invert, b_invert, coArr[9], opcode, aresult[9], coArr[9]);
alu_top A11(src1[10], src2[10], 1'b0, a_invert, b_invert, coArr[10], opcode, aresult[10], coArr[10]);
alu_top A12(src1[11], src2[11], 1'b0, a_invert, b_invert, coArr[11], opcode, aresult[11], coArr[11]);
alu_top A13(src1[12], src2[12], 1'b0, a_invert, b_invert, coArr[12], opcode, aresult[12], coArr[12]);
alu_top A14(src1[12], src2[13], 1'b0, a_invert, b_invert, coArr[13], opcode, aresult[13], coArr[13]);
alu_top A15(src1[14], src2[14], 1'b0, a_invert, b_invert, coArr[14], opcode, aresult[14], coArr[14]);
alu_top A16(src1[15], src2[15], 1'b0, a_invert, b_invert, coArr[15], opcode, aresult[15], coArr[15]);
alu_top A17(src1[16], src2[16], 1'b0, a_invert, b_invert, coArr[16], opcode, aresult[16], coArr[16]);
alu_top A18(src1[17], src2[17], 1'b0, a_invert, b_invert, coArr[17], opcode, aresult[17], coArr[17]);
alu_top A19(src1[18], src2[18], 1'b0, a_invert, b_invert, coArr[18], opcode, aresult[18], coArr[18]);
alu_top A20(src1[19], src2[19], 1'b0, a_invert, b_invert, coArr[19], opcode, aresult[19], coArr[19]);
alu_top A21(src1[20], src2[20], 1'b0, a_invert, b_invert, coArr[20], opcode, aresult[20], coArr[20]);
alu_top A22(src1[21], src2[21], 1'b0, a_invert, b_invert, coArr[21], opcode, aresult[21], coArr[21]);
alu_top A23(src1[22], src2[22], 1'b0, a_invert, b_invert, coArr[22], opcode, aresult[22], coArr[22]);
alu_top A24(src1[23], src2[23], 1'b0, a_invert, b_invert, coArr[23], opcode, aresult[23], coArr[23]);
alu_top A25(src1[24], src2[24], 1'b0, a_invert, b_invert, coArr[24], opcode, aresult[24], coArr[24]);
alu_top A26(src1[25], src2[25], 1'b0, a_invert, b_invert, coArr[25], opcode, aresult[25], coArr[25]);
alu_top A27(src1[26], src2[26], 1'b0, a_invert, b_invert, coArr[26], opcode, aresult[26], coArr[26]);
alu_top A28(src1[27], src2[27], 1'b0, a_invert, b_invert, coArr[27], opcode, aresult[27], coArr[27]);
alu_top A29(src1[28], src2[28], 1'b0, a_invert, b_invert, coArr[28], opcode, aresult[28], coArr[28]);
alu_top A30(src1[29], src2[29], 1'b0, a_invert, b_invert, coArr[29], opcode, aresult[29], coArr[29]);
alu_top A31(src1[30], src2[30], 1'b0, a_invert, b_invert, coArr[30], opcode, aresult[30], coArr[30]);
alu_top A32(src1[31], src2[31], 1'b0, a_invert, b_invert, coArr[31], opcode, aresult[31], coArr[31]);

assign opcode = ( (ALU_control==ALU_AND) || (ALU_control==ALU_NOR)  )? 2'b00 :
                ( (ALU_control==ALU_OR ) || (ALU_control==ALU_NAND) )? 2'b01 :
                ( (ALU_control==ALU_ADD) || (ALU_control==ALU_SUB)  )? 2'b10 :
                                            (ALU_control==ALU_SET )  ? 2'b11 :
                                                                                2'bxx;

always@(*)begin
    if(rst_n)begin
        cout <= ( (ALU_control == ALU_ADD) || (ALU_control == ALU_SUB) ) ? coArr[31] : 1'b0;
        result <= aresult;
        zero <= !result;
        overflow <= cout;
    end
    else begin
        zero <= 1'b0;
        overflow <= 1'b0;
        cout <= 1'b0;
        result <= 1'b0;
    end
end


endmodule
