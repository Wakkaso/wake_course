module counter1 (
    input      reset_n,
    input      clk_n,
    input       [6:0] A,
    input       [6:0] B,
    input      [13:0] C,
    output reg [14:0] count
);

reg [13:0] temp;

always @( posedge clk_n ) begin
    if( !reset_n ) begin
        count = 0;
    end
    else begin
        temp  = A * B;
        count = temp + C;
    end
end

endmodule
