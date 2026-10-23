module instruction_decoder (
    input wire  [11:0] instruction, // Entrada de 12 bits
    output wire  [3:0]  opcode,
    output wire [1:0] reg_dest,
    output wire [1:0] reg_src,
    output wire [3:0] imm4         // Inmediato de 4 bits completo (0 a 15)
);

    assign opcode   = instruction[11:8];  // Opcode (Bits 11 a 8)
    assign reg_dest = instruction[7:6];  // Registro Destino (Bits 7 a 8)
    assign reg_src  = instruction[5:4];  // Registro Fuente / Índice de bit (Bits 5 a 4)
    assign imm4     = instruction[3:0];  // Valor inmedaito (Bits 3 a0)

endmodule
