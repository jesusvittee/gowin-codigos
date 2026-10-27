module alu (
    input wire [3:0] alu_op,     // Código de operación
    input wire [3:0] operand_a,  // Registro destino a modificar
    input wire [3:0] operand_b,  // Contiene la posición del bit en operand_b[1:0] (0 a 3)
    output reg [3:0] result,      // Resultado de 4 bits
    output wire      zero_flag   // Bandera Z
);

    // Opcodes de la ALU
    localparam OP_ADD    = 4'h2;
    localparam OP_SUB    = 4'h3;
    localparam OP_AND    = 4'h4;
    localparam OP_OR     = 4'h5;
    localparam OP_XOR    = 4'h6;
    localparam OP_NOT    = 4'h7;
    localparam OP_SHL    = 4'h8;
    localparam OP_SHR    = 4'h9;
    localparam OP_BITSET = 4'hE; // Poner a 1 un bit específico
    localparam OP_BITCLR = 4'hF; // Poner a 0 un bit específico

    always @(*) begin
        case (alu_op)
            OP_ADD:    result = operand_a + operand_b;
            OP_SUB:    result = operand_a - operand_b;
            OP_AND:    result = operand_a & operand_b;
            OP_OR:      result = operand_a | operand_b;
            OP_XOR:    result = operand_a ^ operand_b;
            OP_NOT:    result = ~operand_a;
            OP_SHL:    result = {operand_a[2:0], 1'b0}; // corre a la izquierda ejm. 0010 a 0001
            OP_SHR:    result = {1'b0, operand_a[3:1]}; // corre hacia la derecha  0010 a 0100

            // Operaciones de modificación de bits individuales:
            OP_BITSET: result = operand_a | (4'b0001 << operand_b[1:0]);  // Coloca en 1
            OP_BITCLR: result = operand_a & ~(4'b0001 << operand_b[1:0]); // Coloca en 0

            default:   result = operand_a;
        endcase
    end

    assign zero_flag = (result == 4'b0000) ? 1'b1 : 1'b0;

endmodule