// Author: 0716055 王耀德  0716045 彭敍溶

module ALU(
    src1_i,
    src2_i,
    ctrl_i,
    shamt,
    result_o,
    zero_o
    );

//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [5-1:0]   ctrl_i;
input  [5-1:0]   shamt;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
reg              zero_o;

//parameter
parameter  ADDU = 5'b00000;
parameter  SUBU = 5'b00001;
parameter   AND = 5'b00010;
parameter    OR = 5'b00011;
parameter   SLT = 5'b00100;
parameter   SRA = 5'b00101;
parameter  SRAV = 5'b00110;
parameter   SLL = 5'b00111;
parameter   MUL = 5'b01000;
parameter    JR = 5'b01001;
parameter  ADDI = 5'b01010;
parameter SLTIU = 5'b01011;
parameter   BEQ = 5'b01100;
parameter   LUI = 5'b01101;
parameter   ORI = 5'b01110;
parameter   BNE = 5'b01111;
parameter    LW = 5'b10000;
parameter    SW = 5'b10001;
parameter  BLEZ = 5'b10010;
parameter  BGTZ = 5'b10011;
parameter     J = 5'b10100;
parameter   JAL = 5'b10101;

wire signed [31:0] signed_src1;
wire signed [31:0] signed_src2;
assign signed_src1 = src1_i;
assign signed_src2 = src2_i;


always @(*)
begin
    zero_o = 0;
    case(ctrl_i)
    ADDU: result_o = src1_i + src2_i;
    SUBU: result_o = src1_i - src2_i;
    AND:  result_o = src1_i & src2_i;
    OR:   result_o = src1_i | src2_i;
    SLT:  result_o = (src1_i - src2_i) >> 31;
    SRA:  result_o = signed_src2 >>> shamt;
    SRAV: result_o = signed_src2 >>> src1_i;
    ADDI: result_o = src1_i + src2_i;
    SLL:  result_o = src2_i << shamt;
    MUL:  result_o = src1_i * src2_i;
    JR:   result_o = src1_i;
    LW:   result_o = src1_i + src2_i;
    SW:   result_o = src1_i + src2_i;
    J:    result_o = 32'b0;
    JAL:  result_o = 32'b0;
    SLTIU:  
    begin
          if(src1_i < src2_i)
              result_o = 32'd1;
          else
              result_o = 32'd0;
    end
    BEQ:
    begin
        result_o = src1_i - src2_i;
        if( src1_i == src2_i )
            zero_o = 1;
        else
            zero_o = 0;      
    end    
    LUI:  result_o = src2_i[15:0] << 16;
    ORI:  result_o = src1_i | { 16'b0, src2_i[15:0] };
    BNE:
    begin
        result_o = src1_i - src2_i;
        if( src1_i != src2_i )
            zero_o = 1;
        else
            zero_o = 0;      
    end
    BLEZ:
    begin
        result_o = 32'b0;
        if( signed_src1 <= 0 )
            zero_o = 1;
        else
            zero_o = 0;
    end
    BGTZ:
    begin
        result_o = 32'b0;
        if( signed_src1 > 0 )
            zero_o = 1;
        else
            zero_o = 0;
    end
    endcase       
end

endmodule
