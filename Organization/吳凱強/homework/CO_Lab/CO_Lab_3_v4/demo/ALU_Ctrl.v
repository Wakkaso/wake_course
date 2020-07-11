// Author: 0716055 王耀德  0716045 彭敍溶

module ALU_Ctrl(
        funct_i,
        ALUOp_i,
        ALUCtrl_o,
        RegWrite2,
		Jump2,
		JumpSrc
        );

//I/O ports
input      [6-1:0] funct_i;
input      [4-1:0] ALUOp_i;

output     [5-1:0] ALUCtrl_o;
output             RegWrite2;
output             Jump2;
output             JumpSrc;

//Internal Signals
reg        [5-1:0] ALUCtrl_o;
reg                RegWrite2;
reg                Jump2;
reg                JumpSrc;

//Select exact operation
always @(*)
begin
    case(ALUOp_i)
    4'b0000:
    begin
        case(funct_i)
        6'b100001:      // ADDU
        begin
            ALUCtrl_o = 5'b00000;
            RegWrite2 = 1;
			Jump2 = 0;
			JumpSrc = 0;
        end  
        6'b100011:      // SUBU    
        begin
            ALUCtrl_o = 5'b00001;
            RegWrite2 = 1;
			Jump2 = 0;
			JumpSrc = 0;
        end
        6'b100100:      // AND
        begin
            ALUCtrl_o = 5'b00010;
            RegWrite2 = 1;
			Jump2 = 0;
			JumpSrc = 0;
        end
        6'b100101:      // OR
        begin
            ALUCtrl_o = 5'b00011;
            RegWrite2 = 1;
			Jump2 = 0;
			JumpSrc = 0;
        end
        6'b101010:      // SLT 
        begin
            ALUCtrl_o = 5'b00100; 
            RegWrite2 = 1;
			Jump2 = 0;
			JumpSrc = 0;
        end
        6'b000011:      // SRA
        begin
            ALUCtrl_o = 5'b00101;
            RegWrite2 = 1;
			Jump2 = 0;
			JumpSrc = 0;
        end
        6'b000111:      // SRAV
        begin
            ALUCtrl_o = 5'b00110; 
            RegWrite2 = 1;
			Jump2 = 0;
			JumpSrc = 0;
        end
        6'b000000:      // SLL 
        begin
            ALUCtrl_o = 5'b00111; 
            RegWrite2 = 1;
			Jump2 = 0;
			JumpSrc = 0;
        end
        6'b011000:      // MUL
        begin
            ALUCtrl_o = 5'b01000; 
            RegWrite2 = 1;
			Jump2 = 0;
			JumpSrc = 0;
        end
        6'b001000:      // JR
        begin
            ALUCtrl_o = 5'b01001; 
            RegWrite2 = 0;
			Jump2 = 1;
			JumpSrc = 1;
        end
        endcase
    end
    4'b0001:        // ADDI
    begin
        ALUCtrl_o = 5'b01010; 
        RegWrite2 = 1;
		Jump2 = 0;
		JumpSrc = 0;
    end   
    4'b0010:        // SLTIU
    begin
        ALUCtrl_o = 5'b01011; 
        RegWrite2 = 1;
		Jump2 = 0;
		JumpSrc = 0;
    end
    4'b0011:        // BEQ
    begin
        ALUCtrl_o = 5'b01100; 
        RegWrite2 = 0;
		Jump2 = 0;
		JumpSrc = 0;
    end
    4'b0100:        // LUI
    begin
        ALUCtrl_o = 5'b01101; 
        RegWrite2 = 1;
		Jump2 = 0;
		JumpSrc = 0;
    end
    4'b0101:        // ORI
    begin
        ALUCtrl_o = 5'b01110; 
        RegWrite2 = 1;
		Jump2 = 0;
		JumpSrc = 0;
    end
    4'b0110:        // BNE
    begin
        ALUCtrl_o = 5'b01111; 
        RegWrite2 = 0;
		Jump2 = 0;
		JumpSrc = 0;
    end 
    4'b0111:        // LW
    begin
        ALUCtrl_o = 5'b10000; 
        RegWrite2 = 1;
		Jump2 = 0;
		JumpSrc = 0;
    end  
    4'b1000:        // SW
    begin
        ALUCtrl_o = 5'b10001; 
        RegWrite2 = 0;
		Jump2 = 0;
		JumpSrc = 0;
    end
    4'b1001:        // BLEZ
    begin
        ALUCtrl_o = 5'b10010; 
        RegWrite2 = 0;
		Jump2 = 0;
		JumpSrc = 0;
    end
    4'b1010:        // BGTZ
    begin
        ALUCtrl_o = 5'b10011; 
        RegWrite2 = 0;
		Jump2 = 0;
		JumpSrc = 0;
    end
    4'b1011:        // J
    begin
        ALUCtrl_o = 5'b10100; 
        RegWrite2 = 0;
		Jump2 = 1;
		JumpSrc = 0;
    end
    4'b1100:        // JAL
    begin
        ALUCtrl_o = 5'b10101; 
        RegWrite2 = 1;
		Jump2 = 1;
		JumpSrc = 0;
    end
    endcase
end

endmodule
