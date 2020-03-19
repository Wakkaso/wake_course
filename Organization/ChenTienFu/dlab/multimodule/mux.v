module mux (
    input       reset_n,
    input       clk_i,
    input       sel,
	input [7:0] input1,
	input [7:0] input2,
    output reg [7:0] result
);

always @( posedge clk_i ) begin
    if( !reset_n ) begin
        result <= 0;
    end
    else begin
        case( sel )  
            1'b0:
				result <= input1;
            1'b1:
				result <= input2;
            default:
				result <= result;
		endcase  
    end
end

endmodule