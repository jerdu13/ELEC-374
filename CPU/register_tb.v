module testbench();

	reg clk;
	reg [31:0] D;
	reg wrt_enable;
	reg clr;
	wire [31:0] Q;
	
	register tb(clr, clk, wrt_enable, D, Q);
	
	initial begin
		
		clr = 0;
		clk = 0;
		D = 0;
		wrt_enable = 0;
		
		#100;
		
		// write to register
		D = 32'h39012FE9;
		wrt_enable = 1;
		
		#100;
		wrt_enable = 0;
		
		#100;
		$display("Register data: %h", Q);
		
		#100;
		clr = 0;
		
		#100;
		$display("Cleared register data: %h", Q);
		
		#100;
		$finish;
	end
	
	always #100 clk = ~clk;
	
endmodule	