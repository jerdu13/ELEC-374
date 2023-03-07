// non restoring
module divider(input signed [31:0] a, b, output reg [31:0] quotient, remainder);
begin
	reg [63:0] result;
	reg [31:0] M;
	result <= {32'b0, a[31:0]};
	M <= b;
	
	reg [1:0] negative_operands;
	integer i;
	
	always @(*) begin
		if (a < 0 && b < 0) begin
			negative_operands <= 2'b11;
			M <= ~M + 1;
			result <= {32'b0, ~result[31:0] + 1};
		end else if (a < 0) begin
			negative_operands <= 2'b10;
			result <= {32'b0, ~result[31:0] + 1};
		end else if (b < 0) begin
			negative_operands <= 2'b01;
			M <= ~M + 1;
		end else begin
			negative_operands <= 2'b00;
		end
		
		
		for (i = 0; i < 32; i + 1) begin
			result <= result << 1;
			
			if (result[63:32] >= 0)
				result <= {result[63:32] - M, result[31:0]};
			else
				result <= {result[63:32] + M, result[31:0]};
			
			if (result[63:32] >= 0)
				result[0] <= 1'b1;
			else
				result[1] <= 1'b0;
		end
		
		if (result[63:32] < 0)
			result <= {result[63:32] + M, result[31:0]};
			
		if (negative_operands == 2'b10 || negative_operands == 2'b01)
			result <= {result[63:32], ~result[31:0] + 1};
		
		quotient <= result[31:0];
		remainder <= result[63:32];
	end
end