/* Titulo - Compuertas
Alumno: Nicolas Vite Jesus
Profersor: Godinez Cardoza German

 Este es un programa escrito en Verilog
 Muestra la forma para programar las
 compuertas digitales basicas.
*/

module compuertas(
    input wire a,
    input wire b,
    output wire and1,
    output wire nand1,
    output wire or1,
    output wire nor1,
    output wire xor1,
    output wire xnor1
);

    assign and1 = a & b;
    assign nand1 = ~ (a & b);
    assign or1 = a | b;
    assign nor1 = ~ (a | b);
    assign xor1= a ^ b;
    assign xnor1 = ~ (a ^ b);

endmodule
