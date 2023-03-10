//restoring
module divider(input wire [31:0] a, b, output reg [31:0] remainder, quotient);

integer i;
reg [31:0] M, Q, temp;
reg [1:0] sign_bits;

always @(b or a)
begin
	M = b;
	Q = a;
	
	if (M[31] == 1 && Q[31] == 0) begin
		sign_bits = 2'b01;
		M = ~M + 1;
	end else if (Q[31] == 1 && M[31] == 0) begin
		sign_bits = 2'b10;
		Q = ~Q + 1;
	end else if (Q[31] == 1 && M[31] == 1) begin
		Q = ~Q + 1;
		M = ~M + 1;
		sign_bits = 2'b11;
	end else begin
		sign_bits = 2'b00;
	end
	
	temp = 0; 
	for(i = 0;i < 32;i = i + 1) begin
		temp = {temp[30:0], Q[31]};
		Q[31:1] = Q[30:0];
		temp = temp - M;
		
		if(temp[31] == 1) begin
			Q[0] = 0;
			temp = temp + M;
		end else begin
			Q[0] = 1;
		end
	end
	
	if (sign_bits == 2'b10 || sign_bits == 2'b01)
		Q = ~Q + 1;
	
	quotient <= Q;
	remainder <= temp;
end
endmodule
