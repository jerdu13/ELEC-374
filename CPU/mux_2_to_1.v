// 2-to-1 mux, for general use

module mux_2_to_1(input wire [31:0] input1, input2, input wire select, output reg [31:0] mux_out);

always @(*) begin
	if(select == 1)
		mux_out <= input1;
	else
		mux_out <= input2;
end
		
endmodule