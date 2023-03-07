module alu(input signed [31:0] a, input signed [31:0] b, input [4:0] op_code, output reg [63:0] z, output reg c);
begin
	reg [31:0] result_hi, result_lo;
	assign z = {result_hi, result_lo};
	
	adder adder_circuit(a, b, result_lo, );
	
	always @ (*) begin
		case (op_code)
			5'b00011:
				assign result_lo = ; // add
			5'b00100:
				assign result_lo = a - b; // sub
			5'b00101:
				assign result_lo = a & b; // and
			5'b00110:
				assign result_lo = a | b; // or
			5'b00111:
				assign result_lo = a >> b; //shift
			5'b01000:
				assign result_lo = a >>>> b; // arithmetic shift
			5'b01001:
				assign result_lo = a << b; // shift
			5'b01010:
				assign result_lo = 1'b0; // rotate right
			5'b01011:
				assign result_lo = 1'b0; // rotate left
		endcase
	end
endmodule