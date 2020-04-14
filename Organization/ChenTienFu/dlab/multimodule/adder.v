module adder(
    input      in_a,
	 input		in_b,
	 output		sum,
		output   cout
);

and a1(cout,in_a,in_b);
xor x1(sum,in_a,in_b);

endmodule