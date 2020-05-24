`define CYCLE_TIME 10
`define END_COUNT 5
module TestBench;

//Internal Signals
reg         CLK;
reg         RST;
integer     count;
integer     handle;
integer     end_count;

Simple_Single_CPU cpu(
    .clk_i(CLK),
    .rst_i(RST)
    );

//Main function

always #(`CYCLE_TIME/2) CLK = ~CLK;

initial  begin
    $readmemb("_CO_Lab2_test_data_addu.txt", cpu.IM.Instr_Mem);
    $dumpfile("simple_cpu.vcd");
    $dumpvars(0, cpu);

    CLK = 0;
    RST = 0;
    count = 0;
    #(`CYCLE_TIME) RST = 1;
end

//Print result
always@(posedge CLK) begin
    count = count + 1;
    if( count == `END_COUNT ) begin
        $display("r0 =%d | r1 =%d | r2 =%d | r3 =%d\nr4 =%d | r5 =%d | r6 =%d | r7 =%d\nr8 =%d | r9 =%d | r10=%d | r11=%d\n",
                cpu.RF.Reg_File[0], cpu.RF.Reg_File[1], cpu.RF.Reg_File[2], cpu.RF.Reg_File[3], cpu.RF.Reg_File[4],
                cpu.RF.Reg_File[5], cpu.RF.Reg_File[6], cpu.RF.Reg_File[7], cpu.RF.Reg_File[8], cpu.RF.Reg_File[9],
                cpu.RF.Reg_File[10],cpu.RF.Reg_File[11]
                );
        $finish;
    end
    else ;
end

endmodule
