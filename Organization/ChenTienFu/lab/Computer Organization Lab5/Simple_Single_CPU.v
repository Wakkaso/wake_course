/***************************************************
Student Name: 
Student ID: 
***************************************************/

`timescale 1ns/1ps
module Simple_Single_CPU(
	input clk_i,
	input rst_i
	);

wire [31:0] pc_o;
wire [31:0] instr;
wire RegWrite;
wire [31:0] RSdata_o;
wire [31:0] RTdata_o;
wire [31:0] ALUresult;
wire MemRead,MemWrite;
wire [31:0] DM_o;

ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_i() ,   
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
        .RDdata_i()  , 
        .RegWrite_i (RegWrite),
        .RSdata_o(RSdata_o) ,  
        .RTdata_o(RTdata_o)   
        );		

Data_Memory Data_Memory(
		.clk_i(clk_i),
		.addr_i(ALUresult),
		.data_i(RTdata_o),
		.MemRead_i(MemRead),
		.MemWrite_i(MemWrite),
		.data_o(DM_o)
		);
		
Decoder Decoder(
        .instr_i(), 
		.ALUSrc(),
		.MemtoReg(),
	    .RegWrite(),
		.MemRead(),
		.MemWrite(),
	    .Branch(),
		.ALUOp(),
		.Jump()
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
		
MUX_2to1 Mux_MemtoReg(
		.data0_i(),       
		.data1_i(),
		.select_i(),
		.data_o()
		);
		
endmodule
		  


