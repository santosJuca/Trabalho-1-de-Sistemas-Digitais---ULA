// Multiplica dois operandos de 8 bits com HA/FA, preservando o produto completo.
module multiplier8 (
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [15:0] product
);

    logic [15:0] partial_sum [0:7];

    assign partial_sum[0] = {8'b0, (a & {8{b[0]}})};
    assign product = partial_sum[7];

    genvar i, j;
    generate
        for (i = 1; i < 8; i = i + 1) begin : rows
            logic [i+8:i+1] carry;
            assign partial_sum[i][i-1:0] = partial_sum[i-1][i-1:0];
            assign partial_sum[i][i+8] = carry[i+8];
            if (i < 7) begin : upper_bits
                assign partial_sum[i][15:i+9] = '0;
            end

            for (j = i; j < i + 8; j = j + 1) begin : bits_sum
                if (j == i) begin : first_bit
                    half_adder ha (
                        .a(partial_sum[i-1][j]),
                        .b(a[j-i] & b[i]),
                        .sum(partial_sum[i][j]),
                        .carry(carry[j+1])
                    );
                end else begin : other_bits
                    full_adder fa (
                        .a(partial_sum[i-1][j]),
                        .b(a[j-i] & b[i]),
                        .cin(carry[j]),
                        .sum(partial_sum[i][j]),
                        .cout(carry[j+1])
                    );
                end
            end
        end
    endgenerate

endmodule
