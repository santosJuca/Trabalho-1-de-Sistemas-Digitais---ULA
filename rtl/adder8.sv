module adder8 (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic       cin,
    output logic [7:0] sum,
    output logic       cout
);

    logic [8:0] carry;

    assign carry[0] = cin;
    assign cout = carry[8];

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_full_adder
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i + 1])
            );
        end
    endgenerate

endmodule
