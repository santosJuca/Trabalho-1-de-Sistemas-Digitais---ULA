//Autor: Juarez, Allan, Theo
`timescale 1ns/1ps
module full_adder_tb;

    logic a;
    logic b;
    logic cin;
    logic sum;
    logic cout;
    logic [1:0] expected;
    integer i;

    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i[2:0];
            #1; // Espera 1 ns antes de comparar.
            expected = a + b + cin;

            if ({cout, sum} !== expected)
                $fatal(1, "Erro: a=%b b=%b cin=%b resultado=%b%b esperado=%b", a, b, cin, cout, sum, expected);
        end

        $display("full_adder_tb: 8 testes passaram");
        $finish;
    end

endmodule
