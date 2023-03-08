module mul_32_bit(input signed [31:0] x, y, output [63:0] rslt);
	
	/* x -> multiplicand
		y -> multiplier
	
	
	*/
	reg[63:0] product;
	reg[2:0] pairs[15:0]; // Array to hold bit pairs and bit-to-right of multiplier for recoding.
	reg[31:0] pp[15:0];	// Partial products
	reg[63:0] spp[15:0]; // Signed partial products
	wire[31:0] x_comp;
	
	assign x_comp = {~x[31], ~x} + 1; // Two's complement of multiplicand x
	integer i, j;
	
	
	initial begin
		pairs[0] = {y[1], y[0], 1'b0};
	end
	
	always @(x or y or x_comp) begin
		for(i = 1; i < 16; i = i+1)
		begin
			pairs[i] = {y[2*i + 1], y[2*i], y[2*i - 1]};
			
			case(pairs[i])
				3'b001 : pp[i] = {x[31], x}; // +1 * M
				3'b010 : pp[i] = {x[31], x};
				3'b011 : pp[i] = {x, 1'b0}; // Concat a 0  to LSB of x to multiply by 2
				3'b100 : pp[i] = {x_comp[31:0], 1'b0}; // -2 * M
				3'b101 : pp[i] = x_comp;
				3'b110 : pp[i] = x_comp;
				default : pp[i] = 0;
			endcase
			
			spp[i] = $signed(pp[i]);
		end
		
		product = 32'b0;
		
		for(j = 0; j < 16; j = j+1)
		begin
			spp[j] = {spp[j], 2'b00};
			product = product + spp[j];
		end			
	end
	
	assign rslt = product;
endmodule
			
		
 