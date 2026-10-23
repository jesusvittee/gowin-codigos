
module contador4bits (
    input wire clk,
    input wire rst,
    output reg [4:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 5'd0;
        end else begin
            if (count == 5'd17)
                count <= 5'd0;
            else
                count <= count + 1'b1;
        end
    end

endmodule