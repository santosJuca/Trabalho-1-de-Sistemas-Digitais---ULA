
// Reutilizado do eda-starter-pack do Prof. Anderson Domingues.
// Arquivo original: rtl/half_adder_1b.sv
// Fonte: https://github.com/andersondomingues/eda-starter-pack

module half_adder (
    input  logic a,
    input  logic b,
    output logic sum,
    output logic carry
);

    assign sum   = a ^ b;
    assign carry = a & b;

endmodule