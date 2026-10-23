/*
    Contador binario de 5 bits
    Este proyecto consiste de un contador con entrada de reloj CLK y reset RST y
    salida de 5 bits.

    ---------------------
    |                   |---> Bit0
    |                   |---> Bit1
 Clk--->|                   |---> Bit2
 Clr--->|                   |---> Bit3
    |                   |
    ---------------------
*/

module contador5bits (
    input wire clk,       // Reloj
    input wire rst,       // Reset
    output reg [4:0] count // Salida de 4 bits
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 5'b0000; // Reiniciar el contador a 0
        end else begin
            count <= count + 1; // Incrementar el contador
        end
    end
endmodule