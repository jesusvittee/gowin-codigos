module cpu_top (
    input wire     clkin,           // Reloj de 27MHz (Pin 52)
    input wire     rst,             // Botón de rest (Activo en bajo)

    input wire [3:0] in0_switches,  // Entradas
    input wire [3:0] in1_switches,

    output wire [3:0] out0_leds,    // Salidas
    output wire [3:0] out1_leds,
    output wire       clockout
);

    // Bus de instrucción de 12 bits
    wire [5:0] pc_addr;
    wire [11:0] instruction;

    // Decodificador
    wire [3:0] opcode;
    wire [1:0] reg_dest;
    wire [1:0] reg_src;
    wire [3:0] imm4;

    // Control
    wire       reg_write_en;
    wire [1:0] reg_src_sel;
    wire       out_en;
    wire       port_sel;
    wire       pc_load;
    wire [3:0] alu_op;

    // Registros y ALU
    wire [3:0] operand_a;
    wire [3:0] operand_b;
    wire [3:0] alu_result;
    wire       zero_flag;

    // E/S
    wire [3:0] io_data_out;
    reg  [3:0] write_data_mux;
    wire      clk;

    // Multiplexor de datos a escribir en el banco de registros
    always @(*) begin
        case (reg_src_sel)
            2'b00: write_data_mux = alu_result;
            2'b01: write_data_mux = imm4;        // Inmediato de 4 bits completo
            2'b10: write_data_mux = io_data_out;
            default: write_data_mux = alu_result;
        endcase
    end

    // Instanciación del Contador de Programa
    program_counter u_pc (
        .clk          (clk),
        .rst          (~rst),
        .load         (pc_load),
        .target_addr  ({reg_dest, reg_src}),   // 4 bits como dirección de salto
        .pc           (pc_addr)
    );

    // Memoria ROM de 12 bits
    instruction_memory u_rom (
        .address       (pc_addr),
        .instruction   (instruction)
    );

    // Decodificador de 12 bits
    instruction_decoder u_decoder (
        .instruction  (instruction),
        .opcode       (opcode),
        .reg_dest     (reg_dest),
        .reg_src      (reg_src),
        .imm4          (imm4)
    );

    // Unidad de Control
    control_unit u_control (
        .opcode         (opcode),
        .reg_src        (reg_src),
        .zero_flag      (zero_flag),
        .reg_write_en   (reg_write_en),
        .reg_src_sel    (reg_src_sel),
        .out_en         (out_en),
        .port_sel       (port_sel),
        .pc_load        (pc_load),
        .alu_op         (alu_op)
    );

    // Banco de Registros (Permite escribir en R0, R1, R2 o R3 según reg_dest)
    register_file u_regfile (
        .clk         (clk),
        .rst         (~rst),
        .write_en    (reg_write_en),
        .reg_dest    (reg_dest),
        .reg_src     (reg_src),
        .write_data  (write_data_mux),
        .operand_a   (operand_a),
        .operand_b   (operand_b)
    );

    // ALU con BITSET / BITCLR
    alu u_alu (
        .alu_op     (alu_op),
        .operand_a  (operand_a),
        .operand_b  ({2'b00, reg_src}), // Pasa la posición del bit en reg_src
        .result     (alu_result),
        .zero_flag  (zero_flag)
    );

    // Módulo de E/S
    io_ports u_io (
        .clk          (clk),
        .rst          (~rst),
        .out_en       (out_en),
        .port_sel     (port_sel),
        .reg_data_in  (operand_a),
        .io_data_out  (io_data_out),
        .in0_switches (in0_switches),
        .in1_switches (in1_switches),
        .out0_leds    (out0_leds),
        .out1_leds    (out1_leds)
    );

    // Divisor de Frecuencia
    divfrec u_divfrec(
        .clkin   (clkin),
        .clr     (~rst),
        .clkout  (clk)
    );

    assign clockout = clk;

endmodule