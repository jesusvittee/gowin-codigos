module control_unit (
    input  wire [3:0] opcode,
    input  wire [1:0] reg_src,
    input  wire       zero_flag,

    output reg        reg_write_en,
    output reg  [1:0] reg_src_sel, // 2'b00: ALU, 2'b01: Inmediato, 2'b10: Entrada (IN)
    output reg        out_en,
    output reg        port_sel,
    output reg        pc_load,
    output reg  [3:0] alu_op
);

    localparam OP_NOP    = 4'h0;
    localparam OP_LOADI  = 4'h1;
    localparam OP_ADD    = 4'h2;
    localparam OP_SUB    = 4'h3;
    localparam OP_AND    = 4'h4;
    localparam OP_OR     = 4'h5;
    localparam OP_XOR    = 4'h6;
    localparam OP_NOT    = 4'h7;
    localparam OP_SHL    = 4'h8;
    localparam OP_SHR    = 4'h9;
    localparam OP_IN     = 4'hA;
    localparam OP_OUT    = 4'hB;
    localparam OP_JMP    = 4'hC;
    localparam OP_JZ     = 4'hD;
    localparam OP_BITSET = 4'hE;
    localparam OP_BITCLR = 4'hF;

    always @(*) begin
        reg_write_en = 1'b0;
        reg_src_sel  = 2'b00;
        out_en       = 1'b0;
        port_sel     = reg_src[0];
        pc_load      = 1'b0;
        alu_op       = opcode;

        case (opcode)
            OP_NOP: begin end

            OP_LOADI: begin
                reg_write_en = 1'b1;
                reg_src_sel  = 2'b01; // Escribe el valor inmediato de 4 bits (imm4)
            end

            OP_ADD, OP_SUB, OP_AND, OP_OR, OP_XOR, OP_NOT, OP_SHL, OP_SHR, OP_BITSET, OP_BITCLR: begin
                reg_write_en = 1'b1;
                reg_src_sel  = 2'b00; // Guarda el resultado de la ALU
            end

            OP_IN: begin
                reg_write_en = 1'b1;
                reg_src_sel  = 2'b10;
            end

            OP_OUT: begin
                out_en = 1'b1;
            end

            OP_JMP: begin
                pc_load = 1'b1;
            end

            OP_JZ: begin
                if (zero_flag == 1'b1) pc_load = 1'b1;
            end

            default: begin
                reg_write_en = 1'b0;
                out_en       = 1'b0;
                pc_load      = 1'b0;
            end
        endcase
    end

endmodule