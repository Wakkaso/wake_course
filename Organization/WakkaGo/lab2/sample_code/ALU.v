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
input  [4-1:0]   ctrl_i;
input  [5-1:0]   shamt;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
reg              zero_o;

//parameter
parameter  ADDU = 4'b0000;
parameter  SUBU = 4'b0001;
parameter   AND = 4'b0010;
parameter    OR = 4'b0011;
parameter   SLT = 4'b0100;
parameter   SRA = 4'b0101;
parameter  SRAV = 4'b0110;
parameter  ADDI = 4'b0111;
parameter SLTIU = 4'b1000;
parameter   BEQ = 4'b1001;
parameter   LUI = 4'b1010;
parameter   ORI = 4'b1011;
parameter   BNE = 4'b1100;

wire signed [31:0] signed_src2;
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
    endcase       
end

endmodule
