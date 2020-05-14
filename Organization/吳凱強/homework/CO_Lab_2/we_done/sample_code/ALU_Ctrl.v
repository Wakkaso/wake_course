// Author: 0716055 王耀德  0716045 彭敍溶

module ALU_Ctrl(
        funct_i,
        ALUOp_i,
        ALUCtrl_o
        );

//I/O ports
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;

//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Select exact operation
always @(*)
begin
    case(ALUOp_i)
    3'b000:
    begin
        case(funct_i)
        6'b100001:
            ALUCtrl_o = 4'b0000;    
        6'b100011:
            ALUCtrl_o = 4'b0001;
        6'b100100:
            ALUCtrl_o = 4'b0010;
        6'b100101:
            ALUCtrl_o = 4'b0011;
        6'b101010:
            ALUCtrl_o = 4'b0100;
        6'b000011:
            ALUCtrl_o = 4'b0101;
        6'b000111:
            ALUCtrl_o = 4'b0110;
        endcase
    end
    3'b001:
    begin
        ALUCtrl_o = 4'b0111;
    end   
    3'b010:
    begin
        ALUCtrl_o = 4'b1000;
    end 
    3'b011:
    begin
        ALUCtrl_o = 4'b1001;
    end  
    3'b100:
    begin
        ALUCtrl_o = 4'b1010;
    end
    3'b101:
    begin
        ALUCtrl_o = 4'b1011;
    end
    3'b110:
    begin
        ALUCtrl_o = 4'b1100;
    end  
    endcase
end

endmodule
