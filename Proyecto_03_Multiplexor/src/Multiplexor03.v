// 03 - Multiplexor
module sumatoria (
input wire s,
input wire a,
input wire b,

output wire or1
);


assign or1 =  (~s & a) | ( s & b);

endmodule