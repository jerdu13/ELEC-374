// uses the hierarchical adder structure from the slides
// if carry_out is 1, then an overflow occured
module adder_32(input wire [31:0] a, b, input wire carry_in, output wire [31:0] result, output wire carry_out);
	wire carry_low;
	
	adder_16 high(a[15:0], b[15:0], carry_in, result[15:0], carry_low);
	adder_16 low(a[31:16], b[31:16], carry_low, result[31:16], carry_out);
endmodule

module adder_16(input wire [15:0] a, b, input wire carry_in, output wire [15:0] result, output wire carry_out);
	wire carry_lowest, carry_low, carry_high;
	
	adder_4 lowest(a[3:0], b[3:0], carry_in, result[3:0], carry_lowest);
	adder_4 low(a[7:4], b[7:4], carry_lowest, result[7:4], carry_low);
	adder_4 high(a[11:8], b[11:8], carry_low, result[11:8], carry_high);
	adder_4 highest(a[15:12], b[15:12], carry_high, result[15:12], carry_out);
endmodule

module adder_4(input wire [3:0] a, b, input wire carry_in, output wire [3:0] result, output wire carry_out);
	wire [3:0] prop_signal, gen_signal, carry;
	
	assign prop_signal = a ^ b;
	assign gen_signal = a & b;
	
	assign carry[0] = carry_in;
	assign carry[1] = gen_signal[0] | (prop_signal[0] & gen_signal[0]);
	assign carry[2] = gen_signal[1] | (prop_signal[1] & gen_signal[0]) | (prop_signal[1] & prop_signal[0] & gen_signal[0]);
	assign carry[3] = gen_signal[2] | (prop_signal[2] & gen_signal[1]) | (prop_signal[2] & prop_signal[1] & gen_signal[0]) | (prop_signal[2] & prop_signal[1] & prop_signal[0] & gen_signal[0]);
	
	
	assign result[3:0] = prop_signal ^ carry; 
	assign carry_out = gen_signal[3] | (prop_signal[3] & gen_signal[2]) | (prop_signal[3] & prop_signal[2] & gen_signal[1]) | (prop_signal[3] & prop_signal[2] & prop_signal[1] & gen_signal[0]) | (prop_signal[3] & prop_signal[2] & prop_signal[1] & prop_signal[0] & gen_signal[0]);
	
endmodule
