/***************************************************
Student Name: 
Student ID: 
***************************************************/
`timescale 1ns/1ps

module ALU_1bit(
	input		src1,       //1 bit source 1  (input)
	input		src2,       //1 bit source 2  (input)
	input 	A_invert,    //1 bit A_invert  (input)
	input		B_invert,    //1 bit B_invert  (input)
	input 	Cin,        //1 bit carry in  (input)
	input 	[2-1:0] operation,  //2 bit operation (input)
	input 	set,
	output reg    result,     //1 bit result    (output)
	output wire    cout   //1 bit carry out (output)
	);

/* Write your code HERE */
parameter ALU_AND  = 2'b00;
parameter ALU_OR   = 2'b01;
parameter ALU_ADD  = 2'b10;
parameter ALU_SLT  = 2'b11;

wire s1,s2;
assign s1 = (A_invert == 1'b1) ? ~src1 : src1;
assign s2 = (B_invert == 1'b1) ? ~src2 : src2; 

wire fa_sum;
wire in;
assign in = Cin;
full_adder fa1( .in_a(s1), .in_b(s2), .cin(in), .sum(fa_sum), .cout(cout) );
//assign cout = ((operation==ALU_ADD)||(operation==ALU_SLT)) ? fa_cout : 1'b0;
always@( * )begin
    case( operation )
        ALU_AND: result = s1 & s2;
        ALU_OR : result = s1 | s2;
        ALU_ADD: result = fa_sum;
		  ALU_SLT: result = set; 
   //     default : result = 1'b0;
    endcase 	
	 
	
end
//always@( * )begin
//    case( operation )
//        ALU_AND: cout = 1'b0;
//        ALU_OR : cout =  1'b0;
//        ALU_ADD, ALU_SLT:  cout = fa_cout; 
//								  
//        default : cout = 1'b0;
//    endcase 	
//	
//	
//end


endmodule

