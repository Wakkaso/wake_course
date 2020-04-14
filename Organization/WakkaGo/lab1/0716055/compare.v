//Name: 王耀德
//Student ID: 0716055
module compare(
    input less,
    input equal,
    input [3-1:0]comp,
    output reg out
    );
parameter LT = 3'b000;
parameter GT = 3'b001;
parameter LE = 3'b010;
parameter GE = 3'b011;
parameter EQ = 3'b110;
parameter NE = 3'b100;
parameter INVALID = 3'b111;

always@(*)begin
    case(comp)
        LT: out <= less & ~equal;
        GT: out <= ~less & ~equal;
        LE: out <= less | equal;
        GE: out <= ~less | equal;
        EQ: out <= equal & ~less;
        NE: out <= ~equal;
        INVALID: out <= 1'b0;
        default: out <= 1'b0;
    endcase
end

endmodule

