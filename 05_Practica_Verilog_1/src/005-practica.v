// Ejercicio 5: Conexión Estructural
module practica005(
    input a, b, c,
    output z
);
    wire aux;

    and g1 (aux, a, b);
    or  g2 (z, aux, c);
endmodule

// Ejercicio 6: Multiplexor 2 a 1
module practica006(
    input a, b, sel,
    output z
);
    assign z = sel ? a : b;
endmodule

// Ejercicio 7: Multiplexor 4 a 1 Procedural
module practica007(
    input [3:0] in,
    input [1:0] sel,
    output reg out
);
    always @(*) begin
        case (sel)
            2'b00: out = in[0];
            2'b01: out = in[1];
            2'b10: out = in[2];
            2'b11: out = in[3];
            default: out = 1'b0;
        endcase
    end
endmodule

// Ejercicio 8: Sumador Completo
module practica008(
    input a, b, cin,
    output s, cout
);
    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

// Ejercicio 9: Comparador de Magnitud
module practica009(
    input [3:0] A, B,
    output G, E, L
);
    assign G = (A > B);
    assign E = (A == B);
    assign L = (A < B);
endmodule

// Ejercicio 10: Decodificador 2 a 4 con Habilitador
module practica010(
    input [1:0] sel,
    input enable,
    output reg [3:0] out
);
    always @(*) begin
        if (!enable) begin
            out = 4'b0000;
        end else begin
            case (sel)
                2'b00: out = 4'b0001;
                2'b01: out = 4'b0010;
                2'b10: out = 4'b0100;
                2'b11: out = 4'b1000;
                default: out = 4'b0000;
            endcase
        end
    end
endmodule

// Ejercicio 11: Flip-Flop D Básico
module practica011(
    input clk, d,
    output reg q
);
    always @(posedge clk) begin
        q <= d;
    end
endmodule

// Ejercicio 12: Flip-Flop D con Reset Asíncrono
module practica012(
    input clk, reset, d,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

// Ejercicio 13: Flip-Flop D con Reset Síncrono
module practica013(
    input clk, reset, d,
    output reg q
);
    always @(posedge clk) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

// Ejercicio 14: Flip-Flop T (Toggle)
module practica014(
    input clk, t,
    output reg q
);
    always @(negedge clk) begin
        if (t)
            q <= ~q;
    end
endmodule

// Ejercicio 15: Registro con Habilitación de Carga
module practica015(
    input clk, reset, load,
    input [3:0] d,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else if (load)
            q <= d;
    end
endmodule

// Ejercicio 16: Contador Ascendente de 4 bits
module practica016(
    input clk, reset,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= q + 1'b1;
    end
endmodule

// Ejercicio 17: Registro de Desplazamiento a la Izquierda
module practica017(
    input clk, reset, din,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= {q[2:0], din};
    end
endmodule

// Ejercicio 18: Contador Ascendente / Descendente
module practica018(
    input clk, reset, up_down,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else if (up_down)
            q <= q + 1'b1;
        else
            q <= q - 1'b1;
    end
endmodule

// Ejercicio 19: Detector de Secuencia "11"
module practica019(
    input clk, reset, in,
    output reg z
);
    parameter S0 = 1'b0, S1 = 1'b1;
    reg state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            z <= 1'b0;
        end else begin
            case (state)
                S0: begin
                    z <= 1'b0;
                    if (in) state <= S1;
                end
                S1: begin
                    if (in) begin
                        z <= 1'b1;
                        state <= S1;
                    end else begin
                        z <= 1'b0;
                        state <= S0;
                    end
                end
            endcase
        end
    end
endmodule

// Ejercicio 20: FSM de 3 Estados (2 Procesos)
module practica020(
    input clk, reset, en,
    output reg [1:0] state_out
);
    parameter A = 2'b00, B = 2'b01, C = 2'b10;
    reg [1:0] current_state, next_state;

    // 1. Proceso secuencial
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= A;
        else
            current_state <= next_state;
    end

    // 2. Proceso combinacional para el siguiente estado
    always @(*) begin
        next_state = current_state;
        case (current_state)
            A: if (en) next_state = B;
            B: if (en) next_state = C;
            C: if (en) next_state = A;
            default: next_state = A;
        endcase
    end

    // Asignación de salida
    always @(*) begin
        state_out = current_state;
    end
endmodule