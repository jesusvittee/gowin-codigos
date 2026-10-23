/*
    Contador binario de 4 bits
    Este proyecto consiste de un contador con entrada de reloj CLK y reset RST y
    salida de 4 bits.

    ---------------------
    |                   |---> Bit0
    |                   |---> Bit1
 Clk--->|                   |---> Bit2
 Clr--->|                   |---> Bit3
    |                   |
    ---------------------
*/
module contador4bits (
    input wire clk,
    input wire rst,
    output reg [3:0] count // salida de 4 bits
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000; // Resetear el contador a 0
        end else begin
            count <= count + 1; // Incrementar el contador en cada flanco de subida del reloj
        end
    end
endmodule