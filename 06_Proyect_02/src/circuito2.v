module circuitoLogico(
    input wire a,
    input wire b,
    input wire c,
    output wire x
);
    assign x = ~((a & ~b) | (b | c)) | (b ^ ~c);

endmodule
