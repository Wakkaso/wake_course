`timescale 1ns / 1ps

module ALU_last(
		input				src1,       //1 bit source 1  (input)
		input				src2,       //1 bit source 2  (input)
		input 				A_invert,    //1 bit A_invert  (input)
		input				B_invert,    //1 bit B_invert  (input)
		input 				Cin,        //1 bit carry in  (input)
		input 	    [2-1:0] operation,  //2 bit operation (input)
		input 			set,
		output reg          result,     //1 bit result    (output)
		output wire          cout,        //1 bit carry out (output)
		output wire 			overflow,
		output wire		less_out
    );

	parameter ALU_AND  = 2'b00;
	parameter ALU_OR   = 2'b01;
	parameter ALU_ADD  = 2'b10;
	parameter ALU_SLT  = 2'b11;

	wire s1, s2 ;//src1 & src2 under the signal A_invert & B_invert
	wire fa_sum ;
	wire fa_cout ;

	assign s1 = A_invert == 1'b1 ? ~src1 : src1;
	assign s2 = B_invert == 1'b1 ? ~src2 : src2; 
   
   


	
	full_adder fa1( .in_a(s1), .in_b(s2), .cin(Cin), .sum(less_out), .cout(cout) );
	
	always@(*)begin
	   case( operation )
        ALU_AND: result = s1 & s2;
        ALU_OR : result = s1 | s2;
        ALU_ADD: result = less_out;
        ALU_SLT: result = set;//this is Not the business of alu_bottom;
        default : result = 1'b0;
		endcase 
		//if({A_invert,B_invert}==2'b01)begin



	end
//	always@( * )begin
//		 case( operation )
//			  ALU_AND: cout = 1'b0;
//			  ALU_OR : cout =  1'b0;
//			  ALU_ADD, ALU_SLT:  cout = fa_cout; 
//									  
//			  default : cout = 1'b0;
//		 endcase 	
//		
//	end

//	always@(*)begin
//		 if( operation == ALU_ADD )begin
//			  case( {src1,src2,less_out,B_invert} )
//					4'b0010:overflow = 1'b1;
//					4'b0111:overflow = 1'b1;
//					4'b1100:overflow = 1'b1;
//					4'b1001:overflow = 1'b1;
//					default:overflow = 1'b0;
//			  endcase
//		 end
//		 else 
//			  overflow = 1'b0;
//	end
	
	xor(overflow, Cin, cout);
endmodule

