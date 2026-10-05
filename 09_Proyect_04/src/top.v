/*
28/09/2026
  Top: instancia el divisor de frecuencia (clkdiv) y el
  multiplexor 4 a 1 (mux41c).
  Las 4 salidas de reloj del divisor son las 4 entradas del mux,
  y el selector elige cuál de ellas se ve en la salida (LED).
*/

module top (
    input wire clk, // Oscilador de 27 MHz
    input wire clr, // Reset del divisor
    input wire [1:0] selector, // Selección de la entrada del mux
    output wire salida  // Salida del mux (LED)
);
// Cables internos entre los dos módulos
    wire c0, c1, c2, c3;

// Divisor de frecuencia
    clkdiv u_divisor (
        .clk(clk),
        .clr(clr),
        .clk421875(c0),
        .clk1647(c1),
        .clk080(c2),
        .clk020(c3)
    );

// Multiplexor 4 a 1
    mux41c u_mux (
        .entrada ({c3, c2, c1, c0}), // entrada[0]=c0 ... entrada[3]=c3
        .selector(selector),
        .salida  (salida)
    );

endmodule