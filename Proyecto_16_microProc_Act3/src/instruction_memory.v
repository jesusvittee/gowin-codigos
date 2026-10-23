module instruction_memory (
    input wire [5:0] address,       // Dirección de 6 bits (0 a 63)
    output reg [11:0] instruction   // Instrucción de 12 bits
);

    always @(*) begin
        case (address)
            // =============================================================
            // PROGRAMA EN BINARIO (12 BITS)
            // Estructura: 12'b [OPCODE_4b] _ [REG_DEST_2b] [REG_SRC/BIT_2b] _ [INMEDIATE_4b]
            // =============================================================
                                    //Proyecto 3

            6'd1: instruction = 12'b0001_0000_0111;     // Dir 4: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Bit 2 = 10,
            6'd2: instruction = 12'b1011_0000_0000;     // Dir 5: BITCLR R0, bit 2 -> Opcode = 1111, R0 = 00, Bit 2 = 10,
            6'd3: instruction = 12'b0001_0000_1111;     // Dir 6: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Port0 = 00, Imm =
            6'd4: instruction = 12'b1011_0000_0000; 

            6'd5: instruction = 12'b0001_0000_1011;     // Dir 4: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Bit 2 = 10,
            6'd6: instruction = 12'b1011_0000_0000;     // Dir 5: BITCLR R0, bit 2 -> Opcode = 1111, R0 = 00, Bit 2 = 10,
            6'd7: instruction = 12'b0001_0000_1111;     // Dir 6: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Port0 = 00, Imm =
            6'd8: instruction = 12'b1011_0000_0000;     

            6'd9: instruction = 12'b0001_0000_1101;     // Dir 4: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Bit 2 = 10,
            6'd10: instruction = 12'b1011_0000_0000;     // Dir 5: BITCLR R0, bit 2 -> Opcode = 1111, R0 = 00, Bit 2 = 10,
            6'd11: instruction = 12'b0001_0000_1111;     // Dir 6: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Port0 = 00, Imm =
            6'd12: instruction = 12'b1011_0000_0000;     // Dir 7: JMP 0 -> Opcode = 1100, TargetAddr = 0000_0000

            6'd13: instruction = 12'b0001_0000_1110;     // Dir 0: LOADI R0, 0 -> Opcode = 0001, R0 = 00, Bit = 00, Imm = 000
            6'd14: instruction = 12'b1011_0010_0000;     // Dir 1: BITSET R0, bit 2 -> Opcode = 1110, R0 = 00, Bit 2 = 10,
            6'd15: instruction = 12'b0001_0000_1111;     // Dir 2: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Port0 = 00, Imm =
            6'd16: instruction = 12'b1011_0000_0000;     // Dir 3: BITSET R0, bit 0 -> Opcode = 1110, R0 = 00, Bit0 = 00
            
            6'd17: instruction = 12'b0001_0000_1101;     // Dir 4: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Bit 2 = 10,
            6'd18: instruction = 12'b1011_0000_0000;     // Dir 5: BITCLR R0, bit 2 -> Opcode = 1111, R0 = 00, Bit 2 = 10,
            6'd19: instruction = 12'b0001_0000_1111;     // Dir 6: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Port0 = 00, Imm =
            6'd20: instruction = 12'b1011_0000_0000;     // Dir 7: JMP 0 -> Opcode = 1100, TargetAddr = 0000_0000

            6'd21: instruction = 12'b0001_0000_1011;     // Dir 4: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Bit 2 = 10,
            6'd22: instruction = 12'b1011_0000_0000;     // Dir 5: BITCLR R0, bit 2 -> Opcode = 1111, R0 = 00, Bit 2 = 10,
            6'd23: instruction = 12'b0001_0000_1111;     // Dir 6: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Port0 = 00, Imm =
            6'd24: instruction = 12'b1011_0000_0000;     

            6'd25: instruction = 12'b0001_0000_0111;     // Dir 4: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Bit 2 = 10,
            6'd26: instruction = 12'b1011_0000_0000;     // Dir 5: BITCLR R0, bit 2 -> Opcode = 1111, R0 = 00, Bit 2 = 10,
            6'd27: instruction = 12'b0001_0000_1111;     // Dir 6: OUT OUT0, R0 -> Opcode = 1011, R0 = 00, Port0 = 00, Imm =
            6'd28: instruction = 12'b1011_0000_0000; 

            // Por defecto NOP (No Operation)   // enciende un led apago enciendo un led apago y asi suceivamente con los 4
            default: instruction = 12'b0000_0000_0000;
        endcase
    end

endmodule