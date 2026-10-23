module program_counter (
    input wire       clk,               // Reloj principal
    input wire       rst,               // Reset asincrono activo en alto
    input wire       load,              // 1 = Carga salto
    input wire [5:0] target_addr,   // Dirección destino de 4 bits
    output reg [5:0] pc           // Contador de dirección actual
);

    always @(posedge clk or posedge  rst) begin
        if (rst) begin
            pc <= 6'b000000;
        end else if (load) begin
            pc <= target_addr;
        end else begin
            pc <= pc + 1'b1;
        end
    end

endmodule
