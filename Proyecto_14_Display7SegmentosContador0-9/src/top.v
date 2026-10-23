module top ( //top1
    input wire reloj,
    input wire resetClk,
    input wire resetCont,
    // input reg [3:0] xN,
    output wire [3:0] salcont,
    output wire [6:0] a_to_gN,
    output wire clksal
    );

    wire pulsos;
    // wire bcd;

    //  divisor de frecuencia
    clkdiv instanceDivFrec01 (
        .clk(reloj),
        .clr(resetClk),
        .clk020(pulsos)
    );

    // Contador 4bits
    contador4bits instanceContador4bits(
        .clk(clk),
        .count(salcont),
        .rst(resetCont)
    );

    Display7Segmentos instanceDisplay7Segmentos(
        .x(salcont),
        .a_to_g(a_to_gN)
    );
    
    assign clk = pulsos;
    assign clksal = pulsos;
    // assign bcd = salcont;
    // assign xN = bcd;

endmodule