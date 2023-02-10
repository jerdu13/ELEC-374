module register(input wire clr, clk, wrt_enable, input wire [31:0] D, output wire [31:0] Q); // D: input data, Q: output data, wrt_enable: R1in
	
	always @(posedge clk) begin
		if(wrt_enable)
			Q <= D;
	end
	
	always @(clr) begin
		Q <= 0;
	end
endmodule