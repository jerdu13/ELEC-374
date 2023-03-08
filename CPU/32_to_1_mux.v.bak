module 32_to_1_mux(
	output wire [31:0] mux_out,
	input wire [31:0] mux_in_r0, mux_in_r1, mux_in_r2, mux_in_r3, mux_in_r4, mux_in_r5, mux_in_r5, mux_in_r6, mux_in_r7,
							mux_in_r8, mux_in_r9, mux_in_r10, mux_in_r11, mux_in_r_12, mux_in_r13, mux_in_r14, mux_in_r15, 
							mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, mux_in_MDR, mux_in_inport, C_sign_extended,
	input wire [4:0] select
);
	always @(mux_in_r0, mux_in_r1, mux_in_r2, mux_in_r3, mux_in_r4, mux_in_r5, mux_in_r5, mux_in_r6, mux_in_r7,
				mux_in_r8, mux_in_r9, mux_in_r10, mux_in_r11, mux_in_r_12, mux_in_r13, mux_in_r14, mux_in_r15, 
				mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, mux_in_MDR, mux_in_inport, C_sign_extended, select)
		case(select)
			5'b00000 : mux_out = mux_in_r0;
			5'b00001 : mux_out = mux_in_r1;
			5'b00010 : mux_out = mux_in_r2;
			5'b00011 : mux_out = mux_in_r3;
			5'b00100 : mux_out = mux_in_r4;
			5'b00101 : mux_out = mux_in_r5;
			5'b00110 : mux_out = mux_in_r6;
			5'b00111 : mux_out = mux_in_r7;
			5'b01000 : mux_out = mux_in_r8;
			5'b01001 : mux_out = mux_in_r9;
			5'b01010 : mux_out = mux_in_r10;
			5'b01011 : mux_out = mux_in_r11;
			5'b01100 : mux_out = mux_in_r12;
			5'b01101 : mux_out = mux_in_r13;
			5'b01110 : mux_out = mux_in_r14;
			5'b01111 : mux_out = mux_in_r15;
			5'b10000 : mux_out = mux_in_HI;
			5'b10001 : mux_out = mux_in_LO;
			5'b10010 : mux_out = mux_in_Z_high;
			5'b10011 : mux_out = mux_in_Z_low;
			5'b10100 : mux_out = mux_in_PC;
			5'b10101 : mux_out = mux_in_MDR;
			5'b10110 : mux_out = mux_in_inport;
			5'b10111 : mux_out = C_sign_extended;
			default	: mux_out = 0;
		endcase
endmodule