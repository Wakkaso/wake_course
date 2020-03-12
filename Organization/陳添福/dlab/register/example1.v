module example1 (
    input reset_n,
    input clk_i,
    input set_n,
    input      [7:0] load,
    output reg [7:0] count
);

always @( posedge clk_i ) begin
    if( !reset_n ) begin
        count <= 0;
    end
    else if ( !set_n ) begin
        count <= load;
    end
    else begin
        count <= count + 1;
    end
end

endmodule