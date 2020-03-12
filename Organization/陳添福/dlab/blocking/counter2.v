module counter2 (
    input      reset_n,
    input      clk_n,
    input      [6:0] A,
    input      [6:0] B,
    input      [13:0] C,
    output reg [14:0] count
);

reg [13:0] temp_ab;
reg [13:0] temp_c;

always @( posedge clk_n ) begin
    if( !reset_n ) begin
        count   <= 0;
		temp_ab <= 0;
		temp_c  <= 0;
    end
    else begin
        temp_ab <= A * B;
        temp_c  <= C;
        count   <= temp_ab + temp_c;
    end
end

endmodule