module z(input wire clr, clk, wrt_enable, hi_enable, lo_enable, input wire [63:0] D, output reg [31:0] z_hi, z_lo);
begin
	always @ (posedge clk) begin
		if (wrt_enable == 1) begin
			if (hi_enable == 1)
				z_hi <= D[63:32];
			else if (lo_enable == 1)
				z_lo <= D[31:0];
		end
	end
	
	always @ (posedge clr) begin
		z_hi <= 32'b0;
		z_lo <= 32'b0;
	end
endmodule