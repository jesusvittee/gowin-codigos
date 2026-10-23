module clkdiv (
    input wire clk,
    input wire clr,
    output wire clk020 // q[26]
);
reg [27:0] q;

always @(posedge clk or posedge clr) // siempre que cambia el clk o el clr, se ejecuta el bloque
    begin
        if (clr == 1)
            q <= 0;
        else
            q <= q + 1;
        end
    
    assign clk020 = q[23]; 
endmodule