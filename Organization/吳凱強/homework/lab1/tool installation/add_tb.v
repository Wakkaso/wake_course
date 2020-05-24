module add_tb;

	reg A, B, CIN;
	wire COUT, SUM;

	add add_1(
		.A(A),
		.B(B),
		.CIN(CIN),
		.COUT(COUT),
		.SUM(SUM)
	);

	initial begin
		$dumpfile("add_tb.vcd");
		$dumpvars(0, add_1);

		#50 A = 1'b0; B = 1'b0; CIN = 1'b0;
		#50 A = 1'b0; B = 1'b0; CIN = 1'b1;
		#50 A = 1'b0; B = 1'b1; CIN = 1'b0;
		#50 A = 1'b0; B = 1'b1; CIN = 1'b1;
		#50 A = 1'b1; B = 1'b0; CIN = 1'b0;
		#50 A = 1'b1; B = 1'b0; CIN = 1'b1;
		#50 A = 1'b1; B = 1'b1; CIN = 1'b0;
		#50 A = 1'b1; B = 1'b1; CIN = 1'b1;
		#50 $finish;
	end

endmodule