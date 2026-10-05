// contador modificado
module top (
    input wire reloj,
    input wire resetClk,
    input wire resetCont,
    output wire clksal,
    output wire [3:0] leds
    );

    wire pulsos;
    wire [3:0] count_internal; 

    // divisor de frecuencia
    clkdiv instanceDivFrec01 (
        .clk(reloj),
        .clr(resetClk),
        .clk020(pulsos)
    );

    // Contador de 4 bits
    contador4bits instanceCont4bits (
        .clk(pulsos),
        .rst(resetCont),
        .count(count_internal)
    );

    assign leds = ~count_internal; // Se invierte la señal para que empiece en 0000 en leds con lógica invertida
    assign clksal = pulsos;
endmodule