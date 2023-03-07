module pc(input wire clr, clk, wrt_enable, pcInc, input wire [31:0] D, output reg [31:0] Q);
begin
	initial Q = 32'b00000000000000000000000000000000;
	
	always @ (posedge clk) begin
		if (pcInc == 1)
			Q <= Q + 1;
		else if (wrt_enable == 1)
			Q <= D;
	end
	
	always @ (posedge clr) begin
		Q <= 32'b00000000000000000000000000000000;
	end
endmodule