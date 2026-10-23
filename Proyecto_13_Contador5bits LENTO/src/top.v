// Actividad 1 a 1 octubre 2026
module top (
    input wire reloj,
    input wire resetClk,
    input wire resetCont,
    output wire clksal,
    output wire [4:0] leds
    );

    wire pulsos;
    wire [4:0] cuenta;

    //  divisor de frecuencia
    clkdiv instanceDivFrec01 (
        .clk(reloj),
        .clr(resetClk),
        .clk020(pulsos)
    );

    // Contador 5 bits
    contador5bits instanceCont5bits (
        .clk(pulsos),
        .rst(resetCont),
        .count(cuenta) // <--- Solo se agregó el '~' aquí para invertir la salida
    );
    
// Invertir la salida para los LEDs
    assign leds = ~cuenta;
    assign clksal = pulsos;
endmodule