/***************************************************
Student Name: 
Student ID: 
***************************************************/

`timescale 1ns/1ps
module Simple_Single_CPU(
	input clk_i,
	input rst_i
	);

//Internal Signles
wire [31:0] pc_i;
wire [31:0] pc_o;
wire [31:0] instr;
wire [31:0] ALUresult;
wire RegWrite;
wire [31:0] RSdata_o;
wire [31:0] RTdata_o;
wire ALUSrc;
wire Branch;
wire [1:0] ALUOp;
		
ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_i(pc_i) ,   
	    .pc_o(pc_o) 
	    );

Instr_Memory IM(
        .addr_i(pc_o),  
	    .instr_o(instr)    
	    );
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_i(rst_i) ,     
        .RSaddr_i(instr[19:15]) ,  
        .RTaddr_i(instr[24:20]) ,  
        .RDaddr_i(instr[11:7]) ,  
        .RDdata_i(ALUresult)  , 
        .RegWrite_i (RegWrite),
        .RSdata_o(RSdata_o) ,  
        .RTdata_o(RTdata_o)   
        );
		
Decoder Decoder(
        .instr_i(instr), 
		.ALUSrc(ALUSrc),
	    .RegWrite(RegWrite),
	    .Branch(Branch),
		.ALUOp(ALUOp)      
	    );	

Adder Adder1(
        .src1_i(),     
	    .src2_i(),     
	    .sum_o()    
	    );
		
Imm_Gen ImmGen(
		.instr_i(),
		.Imm_Gen_o()
		);
	
Shift_Left_1 SL1(
		.data_i(),
		.data_o()
		);
	
MUX_2to1 Mux_ALUSrc(
		.data0_i(),       
		.data1_i(),
		.select_i(),
		.data_o()
		);
			
ALU_Ctrl ALU_Ctrl(
		.instr(),
		.ALUOp(),
		.ALU_Ctrl_o()
		);
		
Adder Adder2(
        .src1_i(),     
	    .src2_i(),     
	    .sum_o()    
	    );
		
alu alu(
		.rst_n(),
		.src1(),
		.src2(),
		.ALU_control(),
		.zero(),
		.result(),
		.cout(),
		.overflow()
		);
	
MUX_2to1 Mux_PCSrc(
		.data0_i(),       
		.data1_i(),
		.select_i(),
		.data_o()
		);
		
endmodule
		  


