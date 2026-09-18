module ula8 (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic [2:0] op,
    output logic [15:0] result
);

    localparam SUM = 3'b000, SUB = 3'b001, MUL = 3'b010, COM = 3'b011,
               AND = 3'b100, OR  = 3'b101, NOT = 3'b110, XOR = 3'b111;

    logic subtract;
    logic [7:0] b_add;
    logic [7:0] sum;
    logic carry_out;
    logic [15:0] product;

    assign subtract = (op == SUB);
    assign b_add = b ^ {8{subtract}};

    adder8 adder (
        .a(a), .b(b_add), .cin(subtract), .sum(sum), .cout(carry_out)
    );

    multiplier8 multiplier (
        .a(a), .b(b), .product(product)
    );

    always_comb begin
        case (op)
            SUM: result = {7'b0, carry_out, sum};
            // Sem carry na subtração, houve empréstimo: estende o resultado negativo.
            SUB: result = {{8{~carry_out}}, sum};
            MUL: result = product;
            COM: result = {15'b0, (a == b)};
            AND: result = {8'b0, (a & b)};
            OR:  result = {8'b0, (a | b)};
            NOT: result = {8'b0, (~a)};
            XOR: result = {8'b0, (a ^ b)};
            default: result = 16'h0000;
        endcase
    end

endmodule
