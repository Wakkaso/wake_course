// Author: 0716055 王耀德  0716045 彭敍溶

module Decoder(
    instr_op_i,
    RegWrite_o,
    ALU_op_o,
    ALUSrc_o,
    RegDst_o,
    Branch_o,
    //! New output
    MemToReg_o,
    // BranchType_o,
    Jump_o,
    MemRead_o,
    MemWrite_o
    );

//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [4-1:0] ALU_op_o;
output         ALUSrc_o;
output   [1:0] RegDst_o;
output         Branch_o;
//! New output
output [2-1:0] MemToReg_o;
//output         BranchType_o;
output         Jump_o;
output         MemRead_o;
output         MemWrite_o;

//Internal Signals
reg    [4-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg      [1:0] RegDst_o;
reg            Branch_o;
//! New output
reg    [2-1:0] MemToReg_o;
//reg            BranchType_o;
reg            Jump_o;
reg            JumpSrc_o;
reg            MemRead_o;
reg            MemWrite_o;

always @ (*) 
begin
    case(instr_op_i)
        6'b000000: ALU_op_o = 4'b0000;
        6'b001000: ALU_op_o = 4'b0001;
        6'b001011: ALU_op_o = 4'b0010;
        6'b000100: ALU_op_o = 4'b0011;
        6'b001111: ALU_op_o = 4'b0100;
        6'b001101: ALU_op_o = 4'b0101;
        6'b000101: ALU_op_o = 4'b0110;
        // add in Lab3
        6'b100011: ALU_op_o = 4'b0111;
        6'b101011: ALU_op_o = 4'b1000;
        6'b000110: ALU_op_o = 4'b1001;
        6'b000111: ALU_op_o = 4'b1010;
        6'b000010: ALU_op_o = 4'b1011;
        6'b000011: ALU_op_o = 4'b1100;
    endcase
end

always @ (*)
begin
    // Lab3: add Branch if less or equal to 0 and Branch if greater than 0
    if(instr_op_i == 6'b000100 || instr_op_i == 6'b000101 || instr_op_i == 6'b000110 || instr_op_i == 6'b000111)
        Branch_o = 1;
    else
        Branch_o = 0;
end

always @ (*)
begin
    if(instr_op_i == 6'b000100 || instr_op_i == 6'b000101)
        RegWrite_o = 0;
    else
        RegWrite_o = 1;
end

always @ (*)
begin
    // Still the same
    if(instr_op_i[5:3] == 3'b000)
        ALUSrc_o = 0;
    else
        ALUSrc_o = 1;
end

always @ (*)
begin
    case(instr_op_i)
        6'b000000: RegDst_o = 01;
        6'b001000: RegDst_o = 00; //
        6'b001011: RegDst_o = 00; //
        6'b000100: RegDst_o = 00;
        6'b001111: RegDst_o = 00; //
        6'b001101: RegDst_o = 00; //
        6'b000101: RegDst_o = 00;
        // add in Lab3
        6'b100011: RegDst_o = 00; //
        6'b101011: RegDst_o = 00; // save word
        6'b000110: RegDst_o = 00; // branch
        6'b000111: RegDst_o = 00; // branch
        6'b000010: RegDst_o = 00; // jump
        6'b000011: RegDst_o = 10; // jump
    endcase
end

// MemToReg: sw, branch, jump = 00;
always @ (*)
begin
    case(instr_op_i)
        6'b000000: MemToReg_o = 2'b01;
        6'b001000: MemToReg_o = 2'b01;
        6'b001011: MemToReg_o = 2'b01;
        6'b000100: MemToReg_o = 2'b11; // 
        6'b001111: MemToReg_o = 2'b01;
        6'b001101: MemToReg_o = 2'b01;
        6'b000101: MemToReg_o = 2'b11; //
        // add in Lab3
        6'b100011: MemToReg_o = 2'b00; 
        6'b101011: MemToReg_o = 2'b11; // save word //
        6'b000110: MemToReg_o = 2'b11; // branch    //    
        6'b000111: MemToReg_o = 2'b11; // branch    //    
        6'b000010: MemToReg_o = 2'b11; // jump      //     
        6'b000011: MemToReg_o = 2'b10; //! jal
    endcase
end
//jump: jump, jal = 1
always @ (*)
begin
    if(instr_op_i == 6'b000010 || instr_op_i == 6'b000011)
        Jump_o = 1;
    else
        Jump_o = 0;
end

//MemRead and MemWrite: sw write, else read
always @ (*)
begin
    if(instr_op_i == 6'b101011) begin
        MemRead_o = 0;
        MemWrite_o = 1;
    end
    else begin
        MemRead_o = 1;
        MemWrite_o = 0;
    end
end

    

endmodule

