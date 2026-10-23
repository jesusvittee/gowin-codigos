module Display7Segmentos (
    input wire [3:0] x,
    output reg [6:0] a_to_g
);

    always @(*) begin
        case (x)
            4'h0: a_to_g = 7'b1111110;
            4'h1: a_to_g = 7'b0110000;
            4'h2: a_to_g = 7'b1101101;
            4'h3: a_to_g = 7'b1111001;
            4'h4: a_to_g = 7'b0110011;
            4'h5: a_to_g = 7'b1011011;
            4'h6: a_to_g = 7'b1011111;
            4'h7: a_to_g = 7'b1110000;
            4'h8: a_to_g = 7'b1111111;
            4'h9: a_to_g = 7'b1111011;
            4'hA: a_to_g = 7'b1110111;
            4'hB: a_to_g = 7'b0011111;
            4'hC: a_to_g = 7'b1001110;
            4'hD: a_to_g = 7'b0111101;
            4'hE: a_to_g = 7'b1001111;
            4'hF: a_to_g = 7'b1000111;
            default: a_to_g = 7'b0000000;
        endcase
    end

endmodule