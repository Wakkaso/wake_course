module add(A, B, CIN, COUT, SUM);

	input A, B, CIN;
	output COUT, SUM;

	assign {COUT, SUM} = A + B + CIN;
	
endmodule