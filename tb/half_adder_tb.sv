//Autor:Allan e Juarez
`timescale 1ns/1ps
module half_adder_tb;

    logic a, b, sum, carry;
    logic [1:0] expected;
    integer i;

    half_adder dut (.a(a), .b(b), .sum(sum), .carry(carry));

    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i[1:0];
            expected = {1'b0, a} + {1'b0, b};
            #1; // Espera 1 ns antes de comparar.
            if ({carry, sum} !== expected)
                $fatal(1, "HA: a=%b b=%b resultado=%b%b esperado=%b", a, b, carry, sum, expected);
        end
        $display("half_adder_tb: 4 testes passaram");
        $finish;
    end

endmodule
