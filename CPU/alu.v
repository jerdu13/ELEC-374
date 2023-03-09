module alu(input wire [31:0] a, b, y, input [4:0] op_code, output wire [63:0] c); //, output reg overflow);
	reg [31:0] result_hi, result_lo;
	wire [31:0] add_result, sub_result, rotate_left_result, rotate_right_result, negate_result, divide_result_hi, divide_result_lo;
	wire [63:0] mul_result;
	//wire [63:0] div_result;
	wire add_carry, sub_carry;
	assign c = {result_hi, result_lo};
	
	adder_32 adder_circuit(y, b, {1'b0}, add_result, add_carry);
	negate negate_circuit(b, negate_result);
	subtractor subtractor_circuit(y, b, 1'b0, sub_result, sub_carry);
	divider divide_circuit(y, b, divide_result_hi, divide_result_lo);
	rotate_right rot_right(y, b, rotate_right_result);
	rotate_left rot_left(y, b, rotate_left_result);
	mul_32_bit multiply(y, b, mul_result);
	
	always @ (*) begin
		//overflow <= 1'b0;
		case (op_code)
			5'b00011: begin // add
				result_lo <= add_result[31:0];
				result_hi <= 32'b0;
				//overflow <= add_carry;
			end
			5'b00100: begin // sub
				result_lo <= sub_result[31:0];
				result_hi <= 32'b0;
				//overflow <= sub_carry;
			end
			5'b00101: begin // and
				result_lo <= y & b;
				result_hi <= 32'b0;
			end
			5'b00110: begin // or
				result_lo <= y | b;
				result_hi <= 32'b0;
			end
			5'b00111: begin //shr
				result_lo <= y >> b;
				result_hi <= 32'b0;
			end
			5'b01000: begin // shra
				result_lo <= y >>> b;
				result_hi <= 32'b0;
			end
			5'b01001: begin // shl
				result_lo <= y << b;
				result_hi <= 32'b0;
			end
			5'b01010: begin // ror
				result_lo <= rotate_right_result;
				result_hi <= 32'b0;
			end
			5'b01011: begin // rol
				result_lo = rotate_left_result; 
				result_hi <= 32'b0;
			end
			5'b01111: begin // mul
				result_hi =  mul_result[63:32];
				result_lo =  mul_result[31:0];
			end
			5'b10000: begin //div
				result_lo = divide_result_lo;
				result_hi = divide_result_hi;
			end
			5'b10001: begin // negate
				result_lo <= negate_result;
				result_hi <= 32'b0;
			end
			5'b10010: begin
				result_lo <= ~b;
				result_hi <= 32'b0;
			end
			default: begin// for operations we haven't written yet as of phase 1
				result_hi <= 32'b0;
				result_lo <= 32'b0;
			end
		endcase
	end
endmodule