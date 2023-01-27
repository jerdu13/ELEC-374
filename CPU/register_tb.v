module register_tb();

wire clk, clr, wrt_enable;
reg[31:0] D, Q;

register(clr, clk, wrt_enable, D, Q);

initial
	begin
		#200
			D = 32'b1111
			wrt_enable = 1;	// Allowing D input from bus to be written to register
			
		#200
			clr = 1;
	end
endmodule