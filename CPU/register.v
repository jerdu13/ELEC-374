module register(input wire clr, clk, wrt_enable, input wire [31:0] D, output reg [31:0] Q); // D: input data, Q: output data, wrt_enable: R1in
	initial Q = 32'b0;
	
	always @(posedge clk) begin
		if (clr == 1)
			Q[31:0] <= 32'b0;
		else if(wrt_enable == 1)
			Q[31:0] <= D[31:0];
	end
	
endmodule