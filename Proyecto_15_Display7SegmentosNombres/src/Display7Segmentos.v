module Display7Segmentos (
    input wire [4:0] x,
    output reg [6:0] a_to_g
);

always @(*) begin
    case (x)
        // JESUS
        5'd0:  a_to_g = 7'b0111100; // J
        5'd1:  a_to_g = 7'b1001111; // E
        5'd2:  a_to_g = 7'b1011011; // S
        5'd3:  a_to_g = 7'b0111110; // U
        5'd4:  a_to_g = 7'b1011011; // S
        5'd5:  a_to_g = 7'b0000000; // Espacio

        // EdUArdO
        5'd6:  a_to_g = 7'b1001111; // E
        5'd7:  a_to_g = 7'b0111101; // d
        5'd8:  a_to_g = 7'b0111110; // U
        5'd9:  a_to_g = 7'b1110111; // A
        5'd10: a_to_g = 7'b0000101; // r
        5'd11: a_to_g = 7'b0111101; // d
        5'd12: a_to_g = 7'b1111110; // O
        5'd13: a_to_g = 7'b0000000; // Espacio

        // JUAN
        5'd14: a_to_g = 7'b0111100; // J
        5'd15: a_to_g = 7'b0111110; // U
        5'd16: a_to_g = 7'b1110111; // A
        5'd17: a_to_g = 7'b0010101; // n 

        default: a_to_g = 7'b0000000; // Apagado
    endcase
end

endmodule

