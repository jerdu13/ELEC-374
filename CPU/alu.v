module alu(input signed [31:0] a, b, y, input [4:0] op_code, output reg [63:0] c, output wire overflow);
begin
	wire [31:0] result_hi, result_lo;
	wire [31:0] add_result, sub_result, add_carry, sub_carry, rotate_left_result, rotate_right_result, negate_result;
	assign c = {result_hi, result_lo};
	
	adder_32 adder_circuit(a, b, 1'b0, add_result, add_carry);
	negate negate_circuit(b, negate_result);
	subtractor subtractor_circuit(a, b, 1'b0, sub_result, sub_carry);
	
	
	always @ (*) begin
		case (op_code)
			5'b00011: begin // add
				result_lo <= add_result[31:0];
				result_hi <= 32'b0;
				assign overflow = add_carry;
			end
			5'b00100: begin // sub
				result_lo <= sub_result[31:0];
				result_hi <= 32'b0;
				assign overflow = sub_carry;
			end
			5'b00101: begin // and
				result_lo <= a & b;
				result_hi <= 32'b0;
			end
			5'b00110: begin // or
				result_lo <= a | b;
				result_hi <= 32'b0;
			end
			5'b00111: begin //shift
				result_lo <= a >> b;
				result_hi <= 32'b0;
			end
			5'b01000: begin // arithmetic shift
				result_lo <= a >>>> b;
				result_hi <= 32'b0;
			end
			5'b01001: begin // shift
				result_lo <= a << b;
				result_hi <= 31'b0;
			end
			5'b01010: begin // rotate right
				result_lo <= 1'b0;
			end
			5'b01011: begin // rotate left
				result_lo = 1'b0; 
			end
			5'b01111: begin // mul
			
			end
			5'b10000: begin //div
			
			end
			5'b10001: begin // negate
				result_lo <= negate_result;
				result_hi <= 32'b0;
			end
			5'b10010: begin
				result_lo <= ~b;
				result_hi <= 32'b0;
			end
			default: // for operations we haven't written yet as of phase 1
				result_hi <= 32'b0;
				result_lo <= 32'b0;
		endcase
	end
endmodule