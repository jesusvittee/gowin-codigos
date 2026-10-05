/*
28 / Septiembre / 2026
    Contador binario de 4 bits
    Este proyecto consiste de un contador con entrada de reloj CLK y reset RST y
    salida de 4 bits.
*/
module contador4bits (
    input wire clk, // Reloj
    input wire rst,  // Reset
    output reg [3:0] count // Salida de 4 bits
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000; // El contador se reinicia a 0
        end else begin
            count <= count + 1
        end
    end

endmodule
