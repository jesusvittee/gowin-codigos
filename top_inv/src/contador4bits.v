module contador4bits (
    input wire clk,
    input wire rst,
    output reg [3:0] count // salida de 4 bits
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000; // Resetear el contador a 0
        end else begin
            count <= count + 1;
        end
    end
endmodule
