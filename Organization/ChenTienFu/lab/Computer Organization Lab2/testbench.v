/***************************************************
Student Name: 
Student ID: 
***************************************************/
`timescale 1ns/1ps

module testbench;

parameter PATTERN_NUMBER = 6'd9;

reg          clk;
reg          rst_n;
reg [32-1:0] src1_in;
reg [32-1:0] src2_in;
reg  [4-1:0] operation_in;

reg  [8-1:0] mem_src1   [0:(PATTERN_NUMBER*4-1)];
reg  [8-1:0] mem_src2   [0:(PATTERN_NUMBER*4-1)];
reg  [8-1:0] mem_opcode [0:(PATTERN_NUMBER-1)];
reg  [8-1:0] mem_result [0:(PATTERN_NUMBER*4-1)];
reg  [8-1:0] mem_zcv    [0:(PATTERN_NUMBER-1)];

reg  [6-1:0] pattern_count;
reg          start_check;
reg  [6-1:0] error_count;
reg  [6-1:0] correct_count;
reg  [6-1:0] error_count_tmp;

wire [32-1:0] result_out;
wire          zero_out;
wire          cout_out;
wire          overflow_out;

wire  [3-1:0] zcv_out;
wire [32-1:0] result_correct;
wire  [3-1:0] zcv_correct;
wire  [4-1:0] opcode_tmp;

	assign zcv_out = {zero_out, cout_out, overflow_out};
	assign opcode_tmp = mem_opcode[pattern_count];
	assign result_correct = {mem_result[4*(pattern_count-1) + 5'd3],
							mem_result[4*(pattern_count-1) + 5'd2],
							mem_result[4*(pattern_count-1) + 5'd1],
							mem_result[4*(pattern_count-1) + 5'd0]};
	assign zcv_correct = mem_zcv[pattern_count-1];

initial begin
	clk   = 1'b0;
	rst_n = 1'b0;
	src1_in = 32'd0;
	src2_in = 32'd0;
	operation_in = 4'h0;
	start_check = 1'd0;
	error_count = 6'd0;
    correct_count = 6'd0;
	error_count_tmp = 6'd0;
	pattern_count = 6'd0;

	$readmemh("src1.txt", mem_src1);
	$readmemh("src2.txt", mem_src2);
	$readmemh("op.txt", mem_opcode);
	$readmemh("result.txt", mem_result);
	$readmemh("zcv.txt", mem_zcv);

	#100 rst_n = 1'b1;
	start_check = 1'd1;
end

always #5 clk = ~clk;

alu alu(
	.rst_n(rst_n),
	.src1(src1_in),
	.src2(src2_in),
	.ALU_control(operation_in),
	.result(result_out),
	.zero(zero_out),
	.cout(cout_out),
	.overflow(overflow_out)
);


always@(posedge clk) begin
	if(pattern_count == (PATTERN_NUMBER+1)) begin
		if(error_count == 6'd0) begin
			$display("*      Congratulation! All data are correct!      *");
			$display("***************************************************");
            $display("Correct Count: %2d", correct_count );
		end
        else begin
			$display("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK0dodood0KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKX0xodooOXKKKKKKKKKKKKK0OOOOOOOOOOOOkkOOOOOOOOoooooooooooooooooooooooooOOOO");
			$display("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK0doodod0KKKKKKKKKKKKKKKKKKKKXX0O0XXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK0dooookKKKKKKKKKKKKKK0OOOOOOOOOOO00kO00OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKX0dooodOO0KXKKKKKKKKKKKKKKXXKxc,.'dXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKOdooooxKXKKKKKKKKKKKK0OOOOO00000X0c.'cOX0KKKK000OOOOOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXXKKKKKKKKKKKKK0dolx0o''cKXKKKKKKKKKKXXKkl,....'dXXKXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXKkxdood0XKKKKKKKKKKKKOO00kxdddooo:....;lllllllld00OOOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKXKkooOXKKKKKKKKKKKX0kkkOk,...lOOOO0XXKKXKkl;.....;o0XXX0xdOXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKX0ocdOxod0XKKKKKKKKKKKKO0Xo.......................dXOOOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKKKKKKKKKKKKKKKKKKXO:...'d0KXKKKKKKKKXXk:;,,.......'''dXNKx;.....'..:x0XXk,..,ONKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXK:...lkddxkkkO0KXXKKKKKOOKk:;::ccclll,...'coolllokXKOOOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKKKKKKKKKKKKKKKKXKo'......':okKXXKKKKXXo.........'',,:xXN0;..':oOd....,oo'...:KXKKKKKKKKKKKKKKKKXXXKKKKKKKKKKKKKKKNO'...........'';oKXKKKKOO0XKOOOkxxdol;....;cc:::::oOKOOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKKKKKKKKKKKKKKXXk;....;:'.....;lxOXXKKK0Okxd:...'colodkKXNk,.,lOXNOl;,'.....c0XKKKKKKKKKKKKKKXX0doxk0KXXXXKKKKKKKXXc....'''',,''....dNXKKKO00c'''.....................cK0kOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKKKKKKKKKKKKKX0l'...'oKXOdc,.....':o0XK0x:;,'..........lXN0:....;dXNKK0l,,ckXXKKKKKKKKKKKKKKKXK:....';clodOKXKKKXNd....oOxxxk0Kd'...dNXKX0OKk'...,;:cclll;....cddxc...;0KkOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKXXXKKKKXXKKKKKKKXX0o,....:OXXKKXX0xo:'....,0XKd'.......',;;:oOXKXXx:'...o0kkkkddxkkOXXKKKKKKKKKKKKKXXkc,.........lKXKKNk,...c0koooxKNo....kNKKKKOK0;..'lddooooo;....;c:;,...:00kOOOOOOOOOOOOOOOOOOOO");
			$display("KKXKxdxk0XXXXXXXXKXXkc'....;xKXKKKKKKKXXKOxollxXOxKKOOx;...ckkO00KXXXOl:'...''.........'oXXKKKKKKKKKKKKKKXXKOxdlc:;,;dXXKXO;...;OOooooxXK:...;0XKKK0O0Xd......................':k0OOOOOOOOOOOOOOOOOOOOOO");
			$display("KXNo....,:ldOKXXKXXd....':xKNXXXXXKKKKKXXKXXXXXKKOdccc:'...'''''.,xNNo...........';;,...,ONKKKKKKKKKKKKKKKKKKXXXXXKKKXXKXO;...,kOdooooxXk'...oNXKKK0OO00occ:ccccclll;....:odddxO000OOOOOOOOOOOOOOOOOOOOO");
			$display("KKXOc,.......,oKXKXkl:ldOXNkollcc::;;;;:oKXKKKKKNx.............',:OXNKdccccc;'...;cc;....:oOXKKKKKKKKKKKKKKKKKKKKKKKKKKXK:...;O0doooolxXO,.'lKXKKKK0OOO0XOollccccccc,....,,,,'''':OKOkOOOOOOOOOOOOOOOOOO");
			$display("KKKKXKkdl:,...;0XKXXXXXXKNO'............,ONKKKKKKOxoooooddxxkkO0XNXXXo.....................:KXKKKKKKKKKKKKXXNXKKK00KXXKXXkccdKNOxkOOOkOKKOx0NXKXKKK0OOkK0,..................''....lXK00OOOOOOOOOOOOOOOOO");
			$display("KKKKKKKXXX0OxkKXKKKKKKKKKXKxllllooodddxx0XKKKKKXOox00xolcccc:::cclONXkc;;;;;;,....,c:'..'lx0XKKKKKKKKKKKXKxlcc;;,,,,:kXKKXNNXkoollcc:;;,,,;:o0NNXKK0OOOOKOoooooollccc,...';;;;'...':clx0OOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKXNXXXKKKKKKKKKKKXXNNNNWNNXXXKKKXXKKKXOd0x'.............,ONNOc:;;::,....,:;...;KNKKKKKKKKKKKKKNO'.........'dNXKKNWd................lNNXKKOOOO0Oxoolcc:;;,''.................cK0kOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKKXXKKKKKKKKKKKXKkxdollcc::;;;;;cOXKKXkk0c...,llllll:'...lNNd................'dNXKKKKKKKKKKKKKXXkoooddxxkk0XXKKXXNKl;:loooodd:....'kNKKKK0OkKK;..........',,....,lll:...,oxk00OOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKKKKKKKKKKKKKKXK:................:KXKXkx0c...,c:::;;;....;0NK0xddooo;....lxxk0XXXXKKKKKKKKKKKKKKXXXXXXXXXKKKKKKKNWk;',:oOKKKo'...'xXKKKKKOOOOKkooolllloolloc'...;ccc;...lX0OOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKKKKXXXKXXXKKKKXKd:;::ccloool,....dXXKXkx0c................xNKKKXXXXNd...'kNXKKKKXXKKKKKKKKKKKKKKKKKKKKKKKXXXXXKKNNO:.....;c;....;OXKKKKKK0OOOOOKXx;,,'''..............':OKOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKKKKXXKko:;;dXXKKKKXXXXXXXXXXNXl....lXXKKXkx0c...,llllcc:;....oNXKXK0OO0o....xNKKKKKKKKKKKKKKKKKKKKKKKKKKKXX0xoccxXXXXXXkl;........,xXXXXKKKKOOOOOO0Ko''',,,,;;:,...'codxkO00OOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKXX0xl;.....lXXKKKKKKXXKXXXXXXl....cKXKKKKkx0c...',,''........cXXXKl..'''...'ONKKKKKKKKKKKKKKKKKKKKKKKKXX0dc,....cKNXXXNNNk;........';cdk0XXKOOOOOOO00OOOOO0KXNXl...,0XOOOkkOOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKXKxc,.....;lkKXKKKKKKX0l;:cldkl....cKXKKKKXkk0:......'',;;,....cXXKXx:,.....'dXXKKKKKKKKKKKKKKKKKKKKKXXOdc'.....:dKXXNXXXkc'....;l:'......,kNKOOOOOOOOOOOO0kdoll:'...;0KkOOOOOOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKNO;.....;lkKXXKKKKKKKKNk'..........,xKXXKKKKkk0;...lkkkO0XKc...'kXKKKXK0Okxdx0XKKKKKKKKKKKKKKKKKKKKKKXXo.....':oOXXKKXXXXd....'cdk0KOxol:;,:ON0OOOOOOOOOkOXx.........:kKOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKX0c',:okKXXKKKKKKKKKKKXXOdl:;'.......'oKXKKKkd0o,,lOOkk0XXXklloOXXKKKKKKKKXXXKKKKKKKKKXXKKKKKKKKKKKKKXXx;,:lx0XXKKKKKXNXX0olodxkxoxKKKXXXKKXXK0OOOOOOOOOOO0Ooc::clodk00O00OOOOOOOOOOOOooooooooooooOO");
			$display("KKKKKXX00KXKKKKKKKKKKKKKKKKKKXXXKOxdl:,'..cKXKKKkodkkkOddkkKNXKXXXXXKKKKKKKKKKKKKKKKKKKKKKXXKKKKKKKKKKKKKKXXKKXXXKKKKKKKKXNXXNK00xooooxKKKKKKKKKKKKOOOOOOOOOOOOO0KKK0K00OOOOK0kOOOOOOOOOOooooooooooooOOO");
			$display("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXXKOkOKXKKKKkoooooooxkkKNXKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXNXXN0kkdooooxKKKKKKKKKKK0OOOOOOOOOOOOOOOOOOOOOOOOOK0OOOOOOOOOOOooooooooooooOOO");
			$display("KKKKKKKKKKKKKKKK0OOOOO0KKKKKKKKKKKKKKXXKKKKKKKKKkoooooooxkxOXKKKKKKKKKKKKXOkKKKKKKKKXKKKXXXXKKKKKKKKKKKKK0KKKKKKKKKKKKKKKXXXXXK0o::x0dxKKKKKKKKKKK0OOOOOOOOOOOOOOOOOOOO00OkOK0k0KOkOOOOooooooooooooOOOOO");
			$display("KKKKKKKKKK0KKKK0OOOOOO0KXXXXKKKKKKXXKXXKKKKKKKKKkooooooodxdOXKKKKKKKKKKKKXkxKXXKKKKXXXKXXKXXKKKKKKKKKKKKK0KKKKKKKKKKKKKKKKXXKXNd...,OkdKKKKKKKKKKK0OOOOOOOOOOOOOOOO00xx0X0k0K0kKXKKKKKKKKKKKKKKK0OOOOOOO");
			$display("KKKKKKKKKKOOOOOOOkOOOO0Xklcd0XKKXXXNXNXKKKKKKKKKkooooooodddOXKKKKKKKKKKKKKKOdod0XKKXNKKXXKXXKKKKKKKKKKKKK0KKKKKKKXXXXXKKKKXKKXK:...;0KOXXXKXXXXXKK0OOOOOOOOOOOOOO0Kd,..,OXOOXK0dlllcccccccccccccoOKOOOOO");
			$display("KKKKKKKKK0OOOOO0000KOOXO'...lNXKXXkllxKXKKKKKKKKxoooooooood0XKKXKkxOKXKKKXKc...:KXKXNKKXXKXXKKKKKKKKKKKK00KKKKKKX0l:ckXXKKKKKNd....,ccccc:;::co0XK0OOOOOOOOOOOOOKk:....,OKOOXNo..................lX0kOOO");
			$display("KKKKKKKKK0OOOOKOc;;d00KO,...;KXXXo....dNKKKKKKKKxoooooooood0XKXKl...oXXKKN0,...,0NKXNKKXXKXXKKKKKKKKKKKK00KKKKKN0;...;KXKKKKNO,................oNKOOOOOOOOOOkOKOl'....:OX0O0KKOo::::::::::::cclldO0OOOOO");
			$display("KKKKKKKKK0kOkOXx....c0NK;...,OWKc....;0XKKKKKKKKxoooooooood0KXXo....cXXKKNx....;KNXNNXXXKKKK0000KXXKKKKKO0KKKKXKc....lXXKKKX0:....,::::cclc,.'lKXK0OOOOOOOOOKOo'....,d0KKkdkK0OKXKKKKKKKKKKKKKKK0OOOOOOO");
			$display("KKKKKKKKKK0OO0XXo....lXKc...'xKl....;x00O0O0XXKKxoooooooood0XXo....,kNKKXX:....,clcccc:;;;;,,''',oKXKKK0O0KKKXKl....:KXKKKX0:....lKKOkOKNNd'..:KXK0OOOOOO00kl'....'o0KKx:...oKO0K0OOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKKKXO:',:cc:'...',;'....''.....'''''''':kXKxooooooooodKKl....'kNKKXNx.......................:0XKKK0O0KKXXl....;0NKKKX0;....':coxkkXKl....lXXKOOOOO00kc.....,lOKKOc.....xN0xxdddxxxxxxdxxxxxkO00OOOO");
			$display("KKKKKKKXNd...................................;KXxoooooooooOO:....,kXKKKN0,....,,....,cclllloooddkKXKKKKOO0KXKl....;OXKKKXXl...,l,...':od:....:KXKK0OOOOXx.....;oOKKOo'....;kNK:.................',dK0kOO");
			$display("KKKKKKKKNx....,llloooooooddddddxxxxxxxdxl'...;0XxoooodoodOx,....;OXKKKXKc....;0x....cXNXXXXXXXXXKKKKKKKOk0X0:.....xNXXXXXX0dox0Xx,..........cKNXKKOOOOOKOl;:lx0KK0o,....'o0XNKo,''..............',dK0OOO");
			$display("KKKKKKKKNk'...cXX0XXOdollcccccccccco0XOXO'...;KXxooodookOo......lNXKKXKl....,OWx....cXXKKKKKKKKKKKKKXK0OOKk;......dWKo:ckXXXXXK0K0c.........,:ox0K0OOOOO0KKK000Oo,.....cOKO0K00KOkkkkkkOl....:kOkO0OOOOO");
			$display("KKKKKKKKXO,...lXO0Kc................:K00Kd;;cONKxooooxOx;.......:XXKXKc....'kNWx....cXNXXXXXXXXXKKKKXK0KOl........lNx...'ONKKKKXk;.....','......'l00OOOOOkkO0kl,.....;kXKOkKKOOK0kOOOOOXk'...;0KkOOOOOOO");
			$display("KKKKKKKK0Kx::l00kKO,...'clllllol,...'kK0KXXKXXX0xooxkd:.........;0NXO;....,xKKNx....,oolllllllokXXKKKKXx,....'....:Xx....dNXKKKNx;',;coxOOxl:,...:0KOOOOO00x:........:0KK0kKKOOK0OOOOOkKK:...'kXOOOOOOOO");
			$display("KKKKKKKKOO0KKK0OkKO,...:KNNNNNWNc....xX0KKKKKKKKxdOd;.....;l'...,0W0;....:OOx0Wx................kNKKKXXl...,dx,...;Kk....lNXKKK0kkOK0d;''lXNK0Okk00OOOOOKO:.....'....;OXK0kKKOOK0kOOOOk0Xl....dXOOOOOOOO");
			$display("KKKKKKKKOOOOOOOOOK0,...,dxxxddol,....xX0KKKKKKX0xOO'...':dKO,...,OWKo;;cxKXkd0Wx.....,;;::::::cdKXKKK000xdk0N0,...,0O'...cXXKKK0kkxl,....cKXKXK0OOOOOOOOXd...,ckk,...,OXKOk0KOO0OkOOOOOOXd....lX0kOOOOOO");
			$display("KKKKKKK0OOOOOOOOkKK:................;OK0KKKKKKKKddOxoodxkx00;...'kNKXXKXXKKkd0Wx....:0XKKKXXXXXXXKKKK0OOOKXKXK;...,0O'...cXXKXKkl;.....;odc;;oK0kOOOOOOO00kdxO0X0;...'kNKOk0KOO0xokOOOOOXx....:K0kOOOOOO");
			$display("KKKKKKK0OOOOOOOOOOKkc;,,,,,;;;::cloxKNKKXXKKKKX0xooxkkxdoo0K;...'kNKKKKKKKKkd0Wx....cXNK000OOkkxxOKK0OOOO0KKXK:...,OO,...lXXKXl.....,ldd:....,0KOOOOOOOOOOOOOOkKK:...'kNKOk0KOOOdox00000XO'...;0KkOOOOOO");
			$display("KKKKKKK0OOOOOOOO00OkkxdollllllcccccccccloOXXKKX0xoooooooooOX:....kNKKKKKKKKkd0Wx....':::;,''......oXX0kOO0KKXXc...,ONd;,cONKKXk::cokOd;....',cox00OOOOOOOOOOOOk0Xc....xNKOk0KOOkxkkddddddl'...;0KkOOOOOO");
			$display("KKKKKKK0OOOOOOO0Ko'......................'kNKKX0dooooooooo0Xc....xNKKKKKK0Kkd0Wx................';xKKOOOO0KKXXc...'ONXK0XXKKKXX0OX0l,....';;'...xXOOOOOOOOOOOOk0Xl....xNKOk00OkOKd............cK0kOOOOOO");
			$display("KKKKKKKOOOOOOOOXO'....',,,,....':ccll;....cXXKX0dodooooooo0Xc....xNKKKKKK0Kkd0Wx....,ccclooodxkO000OOOOOO0KKXXl...'ONKKKKKKKKKKdk0;....;::,....;OKOOOOOOOOOOOOOOKO,..:0XKOk00OOkOkc,'......';o0KOOOOOOOO");
			$display("KKKKKKKOOOOOOOOKO,...;kKK0O;...'d0KKKd'...,0NKX0dooooooood0Nl....xNKKKKKK0KOd0Wx....lNNK00000000OOOOOOOOO0KKXXl...,ONKKKKKKKKKKxdOxlllcc,....'l00OOOOOOOOOOOOOOOOKOxx000KOOOOOOxox0OkkkkkkkO000OOOOOOOOO");
			$display("KKKKKK0OOOOOOOkK0,...':c::;'....''''''....'kNKX0doooodoood0No....kNKKKKKK00OdOWx....lNKOkOOOOOOOOOOOOOOOO0KKKNx'..lXXKKKKKKKKKKxldOX0c.....'lOKOkOOOOOOOOOOOOOOOOOOOOOk0KOOOOOOxookOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKK0OOOOOOOkK0,.........................xNKK0doookKOdod0NO'..;0XKKKKKK00OdOWx....dNKOOOOOOOOOOOO000OOO0KKKXX0xOKXKKKKKKKKKKKxodkKk;..':oOKOkOOOOOOOOOOOKXX0OOOOOOOOOO0OOOOOOxodkOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKKKOOOOOOOOkKK;...'coooo:....,odddd:....dNKK0doooxOkdod0XXOdd0XKKKKKKKO0OdON0:..:0X0OOOOOOOOOOOOKK0OOO0KKKKKKKKKKKKKKKKKKKKKxodkxkkxkO00OOOOOOOOOOOOOO0NWX0OOOOOOOOOO0OOOOOOxodkOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKKK0OOOOOOOOk0Kc....;ccc:,....',,,'''....xNXX0dooooooood0KKXXXKKKKKKKKKO0OdOXXKOOXWX0OOOOOOOOOOOOOOOOOO0KKKKKKKKKKKKKKKKKKKKKxodOxoodkOOOOOOOOOOOOOOOOOO00OOOOOOOOOOOOOOOOOOOxodkOOOOOOOOOOOOOOOOOOOOO");
			$display("KKKK0OOOOOOOOOOOKk,......................'c0XKX0doooooodod0XKKKKKKKKKKKKKO0OdOXKKKXNNX0OOOOOOOOOOOOOOOOOO0KKKKKKXNXKKKKKKKKKKK0xoxOxoodOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOdodkOOOOOOOOOOOOOOOOOOOOO");
			$display("KK00OOOOOOOOOOOOOOkoollllllooooooddddddxk0XXKKXOdooooooooxKXKKKKKKKKKKKK0O0OdkKKKKKKK0OOOOOOOOOOOOOOOOOOO0KKKKKKXXKKKKKKKKKKKK0xlxOxoodOOOOOk0XXOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkdodkOOOOOOOOOOOOOOOOOOOOO");
			$display("OOOOOOOOOOOOOOOOkddxk0XXXXXXXXXXXXXXK000KKKKKKXOdooooooooxKXKKKKKKKKKKKK0OOOdONNXKKKXXK0OOOOOOOOOOKK0OOOO0KKXNXKKKKKKKKKKKKKKK0xoxOxoodkOOOOOO00OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkdodkOOOOOOOOOOOOOOOOOOOOO");
        end
        $finish;
	end
	else if(rst_n) begin
		src1_in			<= {mem_src1[4*pattern_count + 6'd3],
							mem_src1[4*pattern_count + 6'd2],
							mem_src1[4*pattern_count + 6'd1],
							mem_src1[4*pattern_count + 6'd0]};
		src2_in			<= {mem_src2[4*pattern_count + 6'd3],
							mem_src2[4*pattern_count + 6'd2],
							mem_src2[4*pattern_count + 6'd1],
							mem_src2[4*pattern_count + 6'd0]};
		operation_in	<= opcode_tmp;
		pattern_count	<= pattern_count + 6'd1;
	end
end

always@(posedge clk) begin
	if(start_check) begin
		if(pattern_count==0) begin
			$display("***************************************************");
			$display("*             PATTERN RESULT TABLE                *");
			$display("***************************************************");
			$display("* PATTERN *              Result             * ZCV *");
			$display("***************************************************");
		end
		else if(pattern_count < (PATTERN_NUMBER+1)) begin
			if(result_out == result_correct) begin
				if(zcv_out != zcv_correct) begin
					$display("* No.%2d error!                                    *",pattern_count);
					$display("* Correct result: %h     Correct ZCV: %b   *",result_correct, zcv_correct[3-1:0]);
					$display("* Your result: %h        Your ZCV: %b      *",result_out, zcv_out);
					$display("***************************************************");
					error_count <= error_count + 6'd1;
				end
                else begin
                    correct_count <= correct_count + 6'd1;
                end
			end
			else begin
				$display("* No.%2d error!                                    *",pattern_count);
				$display("* Correct result: %h     Correct ZCV: %b   *",result_correct, zcv_correct[3-1:0]);
				$display("* Your result: %h        Your ZCV: %b      *",result_out, zcv_out);
				$display("***************************************************");
				error_count <= error_count + 6'd1;
			end
		end
	end
end

endmodule