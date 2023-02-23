// 2-to-1 mux, for general use

module mux_2_to_1(input wire [31:0] input1, input2, input wire select, output reg [31:0] mux_out);

always @(input1, input2, select)
	if(select)
		mux_out <= input1;
	else
		mux_out <= input2;
		
endmodule