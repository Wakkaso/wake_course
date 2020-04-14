/***************************************************
Student Name:	½²¨|§e
Student ID:	0716074
***************************************************/
`timescale 1ns/1ps

module alu(
	input   rst_n,         // negative reset            (input)
	input	  [32-1:0]	src1,          // 32 bits source 1          (input)
	input	  [32-1:0]	src2,          // 32 bits source 2          (input)
	input   [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg  [32-1:0]	result,        // 32 bits result            (output)
	output reg  zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg  cout,          // 1 bit carry out           (output)
	output reg  overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */
	parameter ALU_AND  = 4'b0000;
	parameter ALU_OR   = 4'b0001;
	parameter ALU_ADD  = 4'b0010;
	parameter ALU_SUB  = 4'b0110;
	parameter ALU_SLT  = 4'b0111;
	parameter ALU_NOR  = 4'b1100;
	parameter ALU_NAND = 4'b1101;


	wire aInvert, bInvert;
	wire [2-1:0] opcode;
	wire  co00, co01, co02, co03, co04, co05, co06, co07, co08, co09, co10, co11, co12, co13, co14, co15, 
			co16, co17, co18, co19, co20, co21, co22, co23, co24, co25, co26, co27, co28, co29, co30, co31;
	wire  complementAddOne;//Used in substraction or SET
	wire  [32-1:0] alu_result;
	wire  alu_overflow;

	wire  less0;
	assign less0 = 1'b0;

	assign aInvert = ( (ALU_control == ALU_NOR ) || ( ALU_control == ALU_NAND ) ) ? 1'b1 : 1'b0;
	assign bInvert = ( (ALU_control == ALU_SUB ) || ( ALU_control == ALU_NOR ) || ( ALU_control == ALU_NAND )) ? 1'b1 : 1'b0;
	assign complementAddOne = ( (ALU_control == ALU_SUB) || ( ALU_control == ALU_SLT) )? 1'b1 : 1'b0; 


	ALU_1bit AL00( .src1(src1[ 0]), .src2(src2[ 0]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(complementAddOne), .operation(opcode), .set(less), .result(alu_result[ 0]), .cout(co00));
	ALU_1bit AL01( .src1(src1[ 1]), .src2(src2[ 1]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co00), .operation(opcode), .set(less0), .result(alu_result[ 1]), .cout(co01) );
	ALU_1bit AL02( .src1(src1[ 2]), .src2(src2[ 2]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co01), .operation(opcode), .set(less0), .result(alu_result[ 2]), .cout(co02) );
	ALU_1bit AL03( .src1(src1[ 3]), .src2(src2[ 3]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co02), .operation(opcode), .set(less0), .result(alu_result[ 3]), .cout(co03) );
	ALU_1bit AL04( .src1(src1[ 4]), .src2(src2[ 4]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co03), .operation(opcode), .set(less0), .result(alu_result[ 4]), .cout(co04) );
	ALU_1bit AL05( .src1(src1[ 5]), .src2(src2[ 5]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co04), .operation(opcode), .set(less0), .result(alu_result[ 5]), .cout(co05) );
	ALU_1bit AL06( .src1(src1[ 6]), .src2(src2[ 6]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co05), .operation(opcode), .set(less0), .result(alu_result[ 6]), .cout(co06) );
	ALU_1bit AL07( .src1(src1[ 7]), .src2(src2[ 7]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co06), .operation(opcode), .set(less0), .result(alu_result[ 7]), .cout(co07) );
	ALU_1bit AL08( .src1(src1[ 8]), .src2(src2[ 8]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co07), .operation(opcode), .set(less0), .result(alu_result[ 8]), .cout(co08) );
	ALU_1bit AL09( .src1(src1[ 9]), .src2(src2[ 9]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co08), .operation(opcode), .set(less0), .result(alu_result[ 9]), .cout(co09) );
	ALU_1bit AL10( .src1(src1[10]), .src2(src2[10]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co09), .operation(opcode), .set(less0), .result(alu_result[10]), .cout(co10) );
	ALU_1bit AL11( .src1(src1[11]), .src2(src2[11]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co10), .operation(opcode), .set(less0), .result(alu_result[11]), .cout(co11) );
	ALU_1bit AL12( .src1(src1[12]), .src2(src2[12]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co11), .operation(opcode), .set(less0), .result(alu_result[12]), .cout(co12) );
	ALU_1bit AL13( .src1(src1[13]), .src2(src2[13]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co12), .operation(opcode), .set(less0), .result(alu_result[13]), .cout(co13) );
	ALU_1bit AL14( .src1(src1[14]), .src2(src2[14]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co13), .operation(opcode), .set(less0), .result(alu_result[14]), .cout(co14) );
	ALU_1bit AL15( .src1(src1[15]), .src2(src2[15]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co14), .operation(opcode), .set(less0), .result(alu_result[15]), .cout(co15) );
	ALU_1bit AL16( .src1(src1[16]), .src2(src2[16]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co15), .operation(opcode), .set(less0), .result(alu_result[16]), .cout(co16) );
	ALU_1bit AL17( .src1(src1[17]), .src2(src2[17]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co16), .operation(opcode), .set(less0), .result(alu_result[17]), .cout(co17) );
	ALU_1bit AL18( .src1(src1[18]), .src2(src2[18]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co17), .operation(opcode), .set(less0), .result(alu_result[18]), .cout(co18) );
	ALU_1bit AL19( .src1(src1[19]), .src2(src2[19]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co18), .operation(opcode), .set(less0), .result(alu_result[19]), .cout(co19) );
	ALU_1bit AL20( .src1(src1[20]), .src2(src2[20]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co19), .operation(opcode), .set(less0), .result(alu_result[20]), .cout(co20) );
	ALU_1bit AL21( .src1(src1[21]), .src2(src2[21]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co20), .operation(opcode), .set(less0), .result(alu_result[21]), .cout(co21) );
	ALU_1bit AL22( .src1(src1[22]), .src2(src2[22]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co21), .operation(opcode), .set(less0), .result(alu_result[22]), .cout(co22) );
	ALU_1bit AL23( .src1(src1[23]), .src2(src2[23]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co22), .operation(opcode), .set(less0), .result(alu_result[23]), .cout(co23) );
	ALU_1bit AL24( .src1(src1[24]), .src2(src2[24]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co23), .operation(opcode), .set(less0), .result(alu_result[24]), .cout(co24) );
	ALU_1bit AL25( .src1(src1[25]), .src2(src2[25]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co24), .operation(opcode), .set(less0), .result(alu_result[25]), .cout(co25) );
	ALU_1bit AL26( .src1(src1[26]), .src2(src2[26]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co25), .operation(opcode), .set(less0), .result(alu_result[26]), .cout(co26) );
	ALU_1bit AL27( .src1(src1[27]), .src2(src2[27]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co26), .operation(opcode), .set(less0), .result(alu_result[27]), .cout(co27) );
	ALU_1bit AL28( .src1(src1[28]), .src2(src2[28]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co27), .operation(opcode), .set(less0), .result(alu_result[28]), .cout(co28) );
	ALU_1bit AL29( .src1(src1[29]), .src2(src2[29]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co28), .operation(opcode), .set(less0), .result(alu_result[29]), .cout(co29) );
	ALU_1bit AL30( .src1(src1[30]), .src2(src2[30]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co29), .operation(opcode), .set(less0), .result(alu_result[30]), .cout(co30) );

	ALU_last AL31( .src1(src1[31]), .src2(src2[31]),  .A_invert(aInvert),  .B_invert(bInvert), .Cin(co30), .operation(opcode), .result(alu_result[31]), .cout(co31), .overflow(alu_overflow), .set(less) );

	assign opcode = ( (ALU_control==ALU_AND) || (ALU_control==ALU_NOR)  )? 2'b00 :
						 ( (ALU_control==ALU_OR ) || (ALU_control==ALU_NAND) )? 2'b01 :
						 ( (ALU_control==ALU_ADD) || (ALU_control==ALU_SUB)  )? 2'b10 :
															  (ALU_control==ALU_SLT )  ? 2'b11 : 
																											  2'bxx;
	always@(*)begin
	  if( rst_n )begin
		 result <= alu_result; 
		 zero   <= !result ;
		 cout   <= ( (ALU_control == ALU_ADD) || (ALU_control == ALU_SUB) ) ? co31 : 1'b0; 
		 overflow <= alu_overflow; 

	  end
	  else begin
		 result    <= 1'b0;
		 zero      <= 1'b0;
		 cout      <= 1'b0;
		 overflow  <= 1'b0;
	  end

	end
endmodule
