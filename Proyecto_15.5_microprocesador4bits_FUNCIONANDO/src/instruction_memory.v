module instruction_memory (
    input  wire [5:0]  address,     // Dirección de 6 bits (0 a 63)
    output reg  [11:0] instruction  // Instrucción de 12 bits
);

    always @(*) begin
        case (address)
            // =========================================================================
            // PROGRAMA EN BINARIO (12 BITS)
            // Estructura: 12'b [OPCODE_4b] _ [REG_DEST_2b] [REG_SRC/BIT_2b] _ [IMMEDIATE_4b]
            // =========================================================================

            6'd0: instruction = 12'b0001_0000_0000; // Dir 0: LOADI R0, 0 -> Opcode=0001, R0=00, Bit=00, Imm=0000
            6'd1: instruction = 12'b1110_0010_0000; // Dir 1: BITSET R0, bit 2 -> Opcode=1110, R0=00, Bit 2=10, Imm=0000
            6'd2: instruction = 12'b1011_0000_0000; // Dir 2: OUT OUT0, R0 -> Opcode=1011, R0=00, Port0=00, Imm=0000
            6'd3: instruction = 12'b1110_0000_0000; // Dir 3: BITSET R0, bit 0 -> Opcode=1110, R0=00, Bit 0=00, Imm=0000
            6'd4: instruction = 12'b1011_0000_0000; // Dir 4: OUT OUT0, R0 -> Opcode=1011, R0=00, Port0=00, Imm=0000
            6'd5: instruction = 12'b1111_0010_0000; // Dir 5: BITCLR R0, bit 2 -> Opcode=1111, R0=00, Bit 2=10, Imm=0000
            6'd6: instruction = 12'b1011_0000_0000; // Dir 6: OUT OUT0, R0 -> Opcode=1011, R0=00, Port0=00, Imm=0000
            6'd7: instruction = 12'b1100_0000_0000; // Dir 7: JMP 0 -> Opcode=1100, TargetAddr=0000_0000 (Dirección 0)



            // Por defecto NOP (No Operation)
            default: instruction = 12'b0000_0000_0000;
        endcase
    end

endmodule