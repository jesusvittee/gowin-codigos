// Modificación de instruction_memory

module instruction_memory (    input  wire [5:0]  address,     // Dirección de 6 bits (0 a 63)
    output wire [11:0] instruction  // Instrucción de 12 bits
);

    // Array de memoria de 64 posiciones de 12 bits
    reg [11:0] rom [0:63];

    initial begin
        // Opción 1: Cargar desde un archivo de valores Hexadecimales
        //$readmemh("program.hex", rom);

        // Opción 2: Cargar desde un archivo de valores Binarios
        $readmemb("program.mem", rom);
    end

    // Lectura asíncrona de la instrucción
    assign instruction = rom[address];

endmodule