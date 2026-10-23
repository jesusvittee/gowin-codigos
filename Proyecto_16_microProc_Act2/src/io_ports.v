module io_ports (
    input wire clk,                  // Reloj del sistema
    input wire rst,                  // Reset asincrono

    // Control desde la Unidad de Control
    input wire out_en,               // Habilitación de escritura en salida
    input wire port_sel,             // Selección de puerto 0 = IN0/OUT0

    // Bus de datos interno
    input wire [3:0] reg_data_in,     // Dato proveniente del resgitro para enviar a 1
    output reg [3:0] io_data_out,   // Dato leído del puerto de entrada hacia los registros

    // Conexiones a los pines físicos de la Tang Nano 9K
    input wire [3:0] in0_switches,  // Puerto de Entrada 0 (ej. Switches/Botones)
    input wire [3:0] in1_switches,  // Puerto de Entrada 1 (ej. Encoder/Entradas GPI)
    output reg [3:0] out0_leds,  // Puerto de Salida 0 (ej. LEDs 0-3)
    output reg [3:0] out1_leds  // Puerto de Salida 1 (ej. LEDs 4-7 / Display)
);

    // 1. Lógica de Entrada (Lectura Multiplexada)
    always @(*) begin
        if (port_sel == 1'b0) begin
            io_data_out = in0_switches;
        end else begin
            io_data_out = in1_switches;
        end
    end
    // 2. Lógica de SALIDA (Escritura Sincrona con Registros)
    always @(posedge clk or posedge rst) begin
        if (rst) begin  
            out0_leds <= 4'b0000;
            out1_leds <= 4'b0000;
        end else if (out_en) begin
            if (port_sel == 1'b0) begin
                out0_leds <= reg_data_in;
            end else begin
                out1_leds <= reg_data_in;
            end
        end
    end

endmodule
