// 04 Sumatoria

module sumatoria(
input wire ci, ai, bi,
output wire si, ci1

);

assign si = (~ci&~ai&bi) | (~ci&ai&~bi) | (ci&~ai&~bi)| (ci&ai&bi);
assign ci1 = (ci & bi) | (ci & ai) | (ai & bi);  // Acarreo

endmodule