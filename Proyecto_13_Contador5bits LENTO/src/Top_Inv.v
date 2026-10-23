// Actividad 1 a 1 octubre 2026
module Top_Inv (
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
        .count(~leds) // <--- Solo se agregó el '~' aquí para invertir la salida
    );

    assign clksal = pulsos;
    //assign clk = pulsos;
endmodule