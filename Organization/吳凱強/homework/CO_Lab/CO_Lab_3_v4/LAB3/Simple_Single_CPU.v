// Author: 0716055 王耀德  0716045 彭敍溶

module Simple_Single_CPU(
    clk_i,
    rst_i
    );

// Input port
input clk_i;
input rst_i;

wire ALUsrc, RegWrite, Branch, zero;
wire branch_mux_control;
wire Jump1, MemRead, MemWrite;
wire RegWrite2, Jump2, JumpSrc, Jump;
wire RegWrite_control;
wire [1:0] MemToReg, RegDst;
wire [3:0] ALU_op;
wire [4:0] ALU_control;
wire [4:0] rs, rt, rd, sh, write_ad;
wire [5:0] op, func;
wire [15:0] im;
wire [31:0] jump_src1, jump_ad; 
wire [31:0] ins;
wire [31:0] pc_in, pc_out, pc_plus4, rs_data, rt_data;
wire [31:0] se_result, ALU_src2, ALU_result, sl2_result, Branch_ad;
wire [31:0] memory_data, data_writeback, pc_src1;

assign {op, rs, rt, rd, sh, func} = ins;
assign jump_src1 = {pc_plus4[31:28], ins[25:0], 2'b00}; 
assign branch_mux_control = Branch & zero;
assign im = ins[15:0];
assign RegWrite_control = RegWrite & RegWrite2;
assign Jump = Jump1 | Jump2; 


ProgramCounter PC(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .pc_in_i(pc_in),
    .pc_out_o(pc_out)
    );

Adder Adder1(
    .src1_i(pc_out),
    .src2_i(32'd4),
    .sum_o(pc_plus4)
    );

Instr_Memory IM(
    .pc_addr_i(pc_out),
    .instr_o(ins)
    );

MUX_4to1 #(.size(5)) Mux_Write_Reg(
    .data0_i(rt),
    .data1_i(rd),
	.data2_i(5'd31),
	.data3_i(5'b0),
    .select_i(RegDst),
    .data_o(write_ad)
    );

Reg_File RF(
    .clk_i(clk_i),
    .rst_i(rst_i) ,
    .RSaddr_i(rs) ,
    .RTaddr_i(rt) ,
    .RDaddr_i(write_ad) ,
    .RDdata_i(data_writeback)  ,
    .RegWrite_i(RegWrite_control),
    .RSdata_o(rs_data) ,
    .RTdata_o(rt_data)
    );

Decoder Decoder(
    .instr_op_i(op),
    .RegWrite_o(RegWrite),
    .ALU_op_o(ALU_op),
    .ALUSrc_o(ALUSrc),
    .RegDst_o(RegDst),
    .Branch_o(Branch),
	.MemToReg_o(MemToReg),
    .Jump_o(Jump1),
    .MemRead_o(MemRead),
    .MemWrite_o(MemWrite)
    );

ALU_Ctrl AC(
    .funct_i(func),
    .ALUOp_i(ALU_op),
    .ALUCtrl_o(ALU_control),
	.RegWrite2(RegWrite2),
    .Jump2(Jump2),
	.JumpSrc(JumpSrc)
    );

Sign_Extend SE(
    .data_i(im),
    .data_o(se_result)
    );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
    .data0_i(rt_data),
    .data1_i(se_result),
    .select_i(ALUSrc),
    .data_o(ALU_src2)
    );

ALU ALU(
    .src1_i(rs_data),
    .src2_i(ALU_src2),
    .ctrl_i(ALU_control),
    .result_o(ALU_result),
    .zero_o(zero),
    .shamt(sh)
    );

Data_Memory Data_Memory(
	.clk_i(clk_i),
	.addr_i(ALU_result),
	.data_i(rt_data),
	.MemRead_i(MemRead),
	.MemWrite_i(MemWrite),
	.data_o(memory_data)
    );

MUX_4to1 #(.size(32)) Mux_MemtoReg(
    .data0_i(memory_data),
    .data1_i(ALU_result),
    .data2_i(pc_plus4),
    .data3_i(32'b0),
    .select_i(MemToReg),
    .data_o(data_writeback)
    );

Adder Adder2(
    .src1_i(pc_plus4),
    .src2_i(sl2_result),
    .sum_o(Branch_ad)
    );

Shift_Left_Two_32 Shifter(
    .data_i(se_result),
    .data_o(sl2_result)
    );

MUX_2to1 #(.size(32)) Mux_branch_or_pcplus4(
    .data0_i(pc_plus4),
    .data1_i(Branch_ad),
    .select_i(branch_mux_control),
    .data_o(pc_src1)
    );
	
MUX_2to1 #(.size(32)) Mux_jump_Source(
    .data0_i(jump_src1),
    .data1_i(rs_data),
    .select_i(JumpSrc),
    .data_o(jump_ad)
    );

MUX_2to1 #(.size(32)) Mux_pc_Source(
    .data0_i(pc_src1),
    .data1_i(jump_ad),
    .select_i(Jump),
    .data_o(pc_in)
    );	

endmodule
