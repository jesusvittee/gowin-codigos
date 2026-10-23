module register_file (
    input wire        clk,                  // Reloj del sistema
    input wire        rst,                  // Reset asincrono
    input wire        write_en,             // Habilitación de escritura (1 = guardar dato)
    input wire  [1:0] reg_dest,             // Registro destino a escribir (R0-R3)
    input wire  [1:0] reg_src,              // Registro fuente a leer B (R0-R3)
    input wire  [3:0] write_data,           // Dato de 4 bits a escribir
    output wire [3:0] operand_a,            // Salida del registro destino (Operación A)
    output wire [3:0] operand_b             // Salida del registro fuente (Operacón B)
);

    // Array de 4 registros de 4 bits cada uno
    reg[3:0] registers [0:3];

    // Escritura sincrónica en el flanco de subida de reloj
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            registers[0] <= 4'b0000;
            registers[1] <= 4'b0000;
            registers[2] <= 4'b0000;
            registers[3] <= 4'b0000;
        end else if (write_en) begin
            registers[reg_dest] <= write_data;
        end
    end

    // Lectura combinacional asincrona
    assign operand_a = registers[reg_dest];
    assign operand_b = registers[reg_src];

endmodule