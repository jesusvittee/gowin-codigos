module mux41c (
    input wire [3:0] entrada,
    input wire [1:0] selector,
    output reg salida
);
always @(*)
    case(selector)
        0: salida = entrada [0];
        1: salida = entrada [1];
        2: salida = entrada [2];
        3: salida = entrada [3];
        default: salida = entrada [0];
    endcase
endmodule