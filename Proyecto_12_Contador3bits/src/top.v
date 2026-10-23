// Actividad 1 a 1 octubre 2026
module top (
    input wire reloj,
    input wire resetClk,
    input wire resetCont,
    output wire clksal,
    output wire [2:0] leds
    );

    wire pulsos;
    wire [2:0] cuenta;

    //  divisor de frecuencia
    clkdiv instanceDivFrec01 (
        .clk(reloj),
        .clr(resetClk),
        .clk020(pulsos)
    );

    // Contador 3 bits
    contador3bits instanceCont3bits (
        .clk(pulsos),
        .rst(resetCont),
        .count(cuenta) 
    );
    
// Invertir la salida para los LEDs
    assign leds = ~cuenta;
    assign clksal = pulsos;
endmodule