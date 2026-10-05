module divisor_frecuencia_6salidas_opt(
    input wire clk_27mhz, reset,
    output wire clk_13m5,
    output wire clk_1m,
    output wire  clk_100k,
    output wire clk_1k,
    output wire clk_10hz,
    output wire clk_1hz
);

// Contador principal de 25 bits (0 a 33,554,431)
reg [24:0] counter;
reg [5:0] outputs;

always @(posedge clk_27mhz or posedge reset) begin
    if (reset) begin
        counter <= 0;
        outputs <= 6'b000000;
    end else begin
        counter <= counter + 1;

        // 13.5 MHz: toggle cada 1 ciclo (periodo total 2 ciclos)
        if (counter % 1 == 0) outputs[0] <= ~outputs[0];

        // 1 MHz: toggle cada 27 ciclos
        if (counter % 27 == 0) outputs[1] <= ~outputs[1];

        // 100 kHz: toggle cada 270 ciclos
        if (counter % 270 == 0) outputs[2] <= ~outputs[2];

        // 1 kHz: toggle cada 27,000 ciclos
        if (counter % 27_000 == 0) outputs[3] <= ~outputs[3];

        // 10 Hz: toggle cada 2,700,000 ciclos
        if (counter % 2_700_000 == 0) outputs[4] <= ~outputs[4];

        // 1 Hz: toggle cada 27, 000,000 ciclos
        if (counter % 27_000_000 == 0) outputs[5] <= ~outputs[5];
    end
end
assign clk_13m5   = outputs[0];
assign clk_1m      = outputs[1];
assign clk_100k    = outputs[2];
assign clk_1k        = outputs[3];
assign clk_10hz = outputs[4];
assign clk_1hz = outputs[5];

endmodule





