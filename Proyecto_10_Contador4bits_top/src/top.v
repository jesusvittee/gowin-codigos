module top (
    input wire reloj,
    input wire resetClk,
    input wire resetCont,
    output wire clksal,
    output wire [3:0] leds
    );

    wire pulsos;

    //  divisor de frecuencia
    clkdiv instanceDivFrec01 (
        .clk(reloj),
        .clr(resetClk),
        .clk020(pulsos)
    );

    // Multiplexor 4 a 1
    contador4bits instanceCont4bits (
        .clk(pulsos),
        .rst(resetCont),
        .count(leds)
    );

    assign clksal = pulsos;
    //assign clk = pulsos;
endmodule