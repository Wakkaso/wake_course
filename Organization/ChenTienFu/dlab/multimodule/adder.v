module adder(
    input      reset_n,
    input      clk_i,
	input      [3:0] input1,
	input      [3:0] input2,
	output reg [7:0] added
);

always @( posedge clk_i ) begin
	if( !reset_n ) begin
		added <= 0;
	end
	else begin
		added <= input1 + input2;
	end
end
endmodule