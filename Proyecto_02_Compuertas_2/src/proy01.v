module compuerta(
    input wire a,
    output wire x,
    output wire y
);

    assign x =a;
    assign y = ~a;
endmodule