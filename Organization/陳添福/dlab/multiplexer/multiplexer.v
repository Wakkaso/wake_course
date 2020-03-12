module multiplexer (
    input      [1:0] sel,
	input      [3:0] input1,
	input      [3:0] input2,
	input      [3:0] input3,
	input      [3:0] input4,
    output reg [3:0] selected
);

always @( input1, input2, input3, input4, sel ) begin
    case( sel )  
        2'b00:
			selected <= input1;
        2'b01:
			selected <= input2;
        2'b10:
			selected <= input3;
        2'b11:
			selected <= input4;
        default:
			selected <= selected;
	endcase  
end

endmodule