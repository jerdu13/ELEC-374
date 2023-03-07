module cpu(input 	R0_enable, R1_enable, R2_enable, R3_enable, R4_enable, R5_enable, R6_enable, R7_enable, R8_enable, 
					R9_enable, R10_enable, R11_enable, R12_enable, R13_enable, R14_enable, R15_enable, HI_enable, LO_enable,
					Zhigh_enable, Zlow_enable, PC_enable, MDR_enable, Inport_enable, C_enable, IR_enable, Y_enable, Z_enable
					
					R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
					R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
					Zlowout, PCout, MDRout, Inportout, Cout,
					
					clk, read,
			input [31:0] Mdatain,
					
			output	R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, HI, LO, IR, BusMuxOut, Z 
					
					);
begin
	
	wire clr;
	wire IR_out;
	
	// mux inputs (reg outputs) for 32-to-5 MUX
	reg [31:0] mux_in_r0, mux_in_r1, mux_in_r2, mux_in_r3, mux_in_r4, mux_in_r5, mux_in_r6, mux_in_r7,
				mux_in_r8, mux_in_r9, mux_in_r10, mux_in_r11, mux_in_r12, mux_in_r13, mux_in_r14, mux_in_r15,
				mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, mux_in_MDR, mux_in_inport, C_sign_extended, mux_in_IR;
				
	// MUX output
	wire [31:0] bus_out;
	
	full_bus bus( 	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
					R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
					Zlowout, PCout, MDRout, Inportout, Cout,
					
					mux_in_r0, mux_in_r1, mux_in_r2, mux_in_r3, mux_in_r4, mux_in_r5, mux_in_r5, mux_in_r6, mux_in_r7,
					mux_in_r8, mux_in_r9, mux_in_r10, mux_in_r11, mux_in_r12, mux_in_r13, mux_in_r14, mux_in_r15, 
					mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, mux_in_MDR, mux_in_inport, C_sign_extended, mux_in_IR
					
					bus_out);
					
	register r0(clr, clk, R0_enable, bus_out, mux_in_r0);
	register r1(clr, clk, R1_enable, bus_out, mux_in_r1);
	register r2(clr, clk, R2_enable, bus_out, mux_in_r2);
	register r3(clr, clk, R3_enable, bus_out, mux_in_r3);
	register r4(clr, clk, R4_enable, bus_out, mux_in_r4);
	register r5(clr, clk, R5_enable, bus_out, mux_in_r5);
	register r6(clr, clk, R6_enable, bus_out, mux_in_r6);
	register r7(clr, clk, R7_enable, bus_out, mux_in_r7);
	register r8(clr, clk, R8_enable, bus_out, mux_in_r8);
	register r9(clr, clk, R9_enable, bus_out, mux_in_r9);
	register r10(clr, clk, R10_enable, bus_out, mux_in_r10);
	register r11(clr, clk, R11_enable, bus_out, mux_in_r11);
	register r12(clr, clk, R12_enable, bus_out, mux_in_r12);
	register r13(clr, clk, R13_enable, bus_out, mux_in_r13);
	register r14(clr, clk, R14_enable, bus_out, mux_in_r14);
	register r15(clr, clk, R15_enable, bus_out, mux_in_r15);
	
	register r_hi(clr, clk, HI_enable, bus_out, mux_in_HI);
	register r_lo(clr, clk, LO_enable, bus_out, mux_in_LO);
	register r_zhigh(clr, clk, Zhigh_enable, bus_out, mux_in_Z_high);
	register r_zlow(clr, clk, Zlow_enable, bus_out, mux_in_Z_low);
	
	register ir(clr, clk, IR_enable, bus_out, IR_out);
	
				
endmodule