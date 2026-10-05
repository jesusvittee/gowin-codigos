module circuitoLogicoDos (
    input wire a,
    input wire b,
    input wire c,
    output wire z
);

    assign z = ~((a | b) & (b ^ c) & ~(a | b | c));

endmodule