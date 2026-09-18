// Testa as oito operações para todos os pares de operandos.
`timescale 1ns/1ps
module ula8_tb;

    logic [7:0] a, b;
    logic [15:0] result, expected;
    logic [2:0] op;
    integer i, j, k;

    ula8 dut (.a(a), .b(b), .op(op), .result(result));

    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 256; j = j + 1) begin
                for (k = 0; k < 8; k = k + 1) begin
                    a = i[7:0];
                    b = j[7:0];
                    op = k[2:0];
                    case (op)
                        3'b000: expected = i + j;
                        3'b001: expected = i - j;
                        3'b010: expected = i * j;
                        3'b011: expected = (i == j) ? 16'd1 : 16'd0;
                        3'b100: expected = i & j;
                        3'b101: expected = i | j;
                        3'b110: expected = 255 - i;
                        3'b111: expected = i ^ j;
                        default: expected = 16'd0;
                    endcase
                    #1; // Espera 1 ns antes de comparar.
                    if (result !== expected)
                        $fatal(1, "ULA: op=%b a=%h b=%h resultado=%h esperado=%h",
                               op, a, b, result, expected);
                end
            end
        end

        // Volta as entradas para zero.
        a = 0;
        b = 0;
        op = 3'b000;
        #1;
        if (result !== 16'h0000)
            $fatal(1, "ULA: 0 + 0 deu %h, esperado 0000", result);

        op = 3'bxxx;
        #1;
        if (result !== 16'h0000)
            $fatal(1, "ULA: op=xxx deu %h, esperado 0000", result);
        op = 3'bzzz;
        #1;
        if (result !== 16'h0000)
            $fatal(1, "ULA: op=zzz deu %h, esperado 0000", result);

        $display("ula8_tb: 524288 combinações, retorno a zero e 2 seletores inválidos passaram");
        $finish;
    end

endmodule
