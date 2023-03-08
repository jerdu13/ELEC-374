module subtractor(input wire [31:0] a, b, input wire carry_in, output wire [31:0] result, output wire carry_out);
	wire [31:0] negated_b;
	negate negate_circuit(b, negated_b);
	adder_32 adder_circuit(a, negated_b, carry_in, result, carry_out);
endmodule