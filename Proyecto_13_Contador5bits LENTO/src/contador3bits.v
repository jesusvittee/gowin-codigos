module contador3bits (
    input wire clk,
    input wire rst,
    output reg [2:0] count // salida de 4 bits
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 3'b0000; // Resetear el contador a 0
        end else begin
            count <= count + 1; // Incrementar el contador en cada flanco de subida del reloj
        end
    end
endmodule