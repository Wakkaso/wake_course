module exponential (
    input reset_n,
    input clk_i,
    input      [1:0] num,
    output reg [3:0] exp
);

always @( posedge clk_i ) begin
    if( !reset_n ) begin
        exp <= 0;
    end
    else begin
        case( num )  
            2'b00:
				exp <= 4'b0001;
            2'b01:
				exp <= 4'b0010;
            2'b10:
				exp <= 4'b0100;
            2'b11:
				exp <= 4'b1000;
            default:
				exp <= exp;
		endcase  
    end
end

endmodule