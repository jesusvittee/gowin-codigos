module top (
    input wire reloj,
    input wire resetClk,
    input wire resetCont,

    output wire [4:0] salcont,
    output wire [6:0] a_to_gN,
    output wire clksal
);

    wire pulsos;

    // Divisor de frecuencia
    clkdiv instanceDivFrec01 (
        .clk(reloj),
        .clr(resetClk),
        .clk020(pulsos)
    );

    // Contador de 5 bits
    contador4bits instanceContador4bits (
        .clk(pulsos),
        .rst(resetCont),
        .count(salcont)
    );

    // Decodificador del display
    Display7Segmentos instanceDisplay7Segmentos (
        .x(salcont),
        .a_to_g(a_to_gN)
    );

    // Salida del reloj dividido
    assign clksal = pulsos;

endmodule
