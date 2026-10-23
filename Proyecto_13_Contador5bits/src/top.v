// Actividad 1 a 1 octubre 2026
module top (
    input wire reloj,
    input wire resetClk,
    input wire resetCont,
    output wire clksal,
    output wire [3:0] leds
    );

    wire pulsos;
    wire [3:0] cuenta;

    //  divisor de frecuencia
    clkdiv instanceDivFrec01 (
        .clk(reloj),
        .clr(resetClk),
        .clk020(pulsos)
    );

    // Contador de 4 bits
    contador4bits instanceCont4bits (
        .clk(pulsos),
        .rst(resetCont),
        .count(cuenta) // <--- Solo se agregó el '~' aquí para invertir la salida
    );
    //Invertir salida para los LEDS
    assign leds = ~cuenta;

    //Salida del relooj dividido
    assign clksal = pulsos;

endmodule