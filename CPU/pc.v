module pc(input wire clr, clk, wrt_enable, pcInc, input wire [31:0] D, output reg [31:0] Q);
	initial Q = 32'b0;
	
	always @ (posedge clk) begin
		if (pcInc == 1)
			Q <= Q + 1;
		else if (wrt_enable == 1)
			Q <= D;
	end
	
	always @ (posedge clr) begin
		Q <= 32'b0;
	end
endmodule