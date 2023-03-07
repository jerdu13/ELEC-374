module mdr(input wire clk, clr, MDRin, read, input wire [31:0] bus_mux_out, mem_data_in, output reg [31:0] mdr_out); // MDRin -> write enable, read -> acts as select

	reg [31:0] md_mux_out;	// Takes on value of bus_mux_out or mem_data_in

	always @(bus_mux_out, mem_data_in, read)	
	
		md_mux_out = mux_2_to_1(mem_data_in, bus_mux_out, read, md_mux_out);	// 2-to-1 mux selects either the input from the memory unit or the bus
		register mdr_reg(clr, clk, MDRin, md_mux_out, mdr_out);	// Instantiate the register depending on the selected input from the mux

endmodule
	