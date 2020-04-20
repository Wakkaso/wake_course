`timescale 1ns / 1ps

module full_adder(
    input in_a,
    input in_b,
    input cin,
    output sum,
    output cout
    );

	wire s, c1, c2;
	xor(s, in_a, in_b);
	and(c1, in_a, in_b);
	xor(sum, s, cin);
	and(c2, s, cin);
	or(cout, c2, c1);

endmodule
