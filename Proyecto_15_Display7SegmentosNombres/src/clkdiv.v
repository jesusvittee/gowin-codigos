
module clkdiv (
    input wire clk,
    input wire clr,
/*
    //output wire clk421875, // q[5]
    //output wire clk1647, // q[13]
    //output wire clk080, // q[24]*/
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
 /*  
    //assign clk421875 = q[5]; // 421875 Hz
    //assign clk1647 = q[13]; // 1647 Hz
    //assign clk080 = q[24]; // 0.8 Hz */
    assign clk020 = q[24]; // 0.2 Hz  
endmodule