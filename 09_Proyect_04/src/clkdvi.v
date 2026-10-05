// DIVISOR 2
module clkdiv (
    input wire clk , //52
    input wire clr ,
    output wire clk421875 ,     // q[5]
    output wire clk1647 ,       // q[13]
    output wire clk080 ,        // q[24]
    output wire clk020          // q[26]
);
reg [27:0] q; // es un registro de 28 datos su capacidad es de 2 a la 28

always @ (posedge clk or posedge clr) // espera los datos de entrada cual quiera de los dos la hace funcionar
    begin
             if(clr==1) // espera solamente clr para que ponga todo en cero lo resete
                q<=0;
            else
                q<=q + 1; // hara funcionar todo
    end
// el estado de la posicion de registro mandalo a q[n]
// entre mas a la izquierda parpadea mas rapido

    assign clk421875 = q[20]; //421875 Bz - el mas rapido
    assign clk1647 = q[21];     //1647 Bz
    assign clk080 = q[22];       //0.8 Bz
    assign clk020 = q[23];      //0.2 Bz - el mas lento
endmodule