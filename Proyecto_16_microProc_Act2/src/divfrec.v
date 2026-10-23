module divfrec (
    input wire clkin,
    input wire clr,
//  output wire clk421875,   //q[5]
//  output wire clk1647,     //q[13]
//  output wire clk080,      //q[24]
    output wire clkout       //q[26]
);
reg [27:0] q;

always @(posedge clkin or posedge clr)
    begin
        if (clr == 1)
            q <= 0;
        else
            q <= q + 1;
        end
//      assign clk421875 = q[22];   // 421875 Hz
//      assign clk1647   = q[23];   // 1647 Hz
//      assign clk080    = q[24]    // 0.8 Hz
    assign clkout        = q[22];   // 0.2 Hz
endmodule