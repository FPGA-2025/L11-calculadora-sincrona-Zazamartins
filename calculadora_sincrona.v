module calculadora_sincrona(
    input clk,
    input rst,
    input [7:0] entrada,
    input [2:0] codigo,
    output reg [7:0] saida
);
    
    // Registrador acumulador
    reg [7:0] acumulador;
    
    // Lógica síncrona com reset assíncrono
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset assíncrono
            acumulador <= 8'b0;
            saida <= 8'b0;
        end else begin
            case (codigo)
                3'b000: begin // Mostrar Entrada
                    saida <= entrada;
                    // Acumulador permanece o mesmo
                end
                3'b001: begin // Somar
                    acumulador <= acumulador + entrada;
                    saida <= 8'b0;
                end
                3'b010: begin // Subtrair
                    acumulador <= acumulador - entrada;
                    saida <= 8'b0;
                end
                3'b011: begin // Mostrar Acumulador
                    saida <= acumulador;
                    // Acumulador permanece o mesmo
                end
                default: begin // Caso inválido
                    saida <= 8'b0;
                    // Acumulador permanece o mesmo
                end
            endcase
        end
    end

endmodule