module practica004(
input [7:0]palabra,
 output [7:0]comp1
);
assign comp1 = ~palabra;

endmodule