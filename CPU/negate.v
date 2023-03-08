// to negate, we do a bit-wise not, then add one to obtain the resulting two's compliment
module negate(input wire [31:0] a, output wire [31:0] result);
	wire [31:0] not_a;
	wire [31:0] one;
	wire carry_in;
	wire carry_out; // required for adder circuit, but effectively does nothing
	
	assign not_a = ~a;
	assign one = 32'b0;
	assign carry_in = 1'b0;
	adder_32 add_one(not_a, one, carry_in, result, carry_out);
endmodule