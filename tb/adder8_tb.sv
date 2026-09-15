// Testa todas as combinações de A, B e carry do somador.
`timescale 1ns/1ps
module adder8_tb;

    logic [7:0] a, b, sum;
    logic cin, cout;
    logic [8:0] expected;
    integer i;

    adder8 dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        for (i = 0; i < 131072; i = i + 1) begin
            {a, b, cin} = i[16:0];
            expected = {1'b0, a} + {1'b0, b} + {8'b0, cin};
            #1;
            if ({cout, sum} !== expected)
                $fatal(1, "Somador: a=%h b=%h cin=%b resultado=%h esperado=%h",
                       a, b, cin, {cout, sum}, expected);
        end
        $display("adder8_tb: 131072 testes passaram");
        $finish;
    end

endmodule
