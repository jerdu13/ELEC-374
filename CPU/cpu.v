`timescale 1ns/10ps
module cpu(input 	R0_enable, R1_enable, R2_enable, R3_enable, R4_enable, R5_enable, R6_enable, R7_enable, R8_enable, 
					R9_enable, R10_enable, R11_enable, R12_enable, R13_enable, R14_enable, R15_enable, HI_enable, LO_enable,
					Zhigh_enable, Zlow_enable, PC_enable, MDR_enable, Inport_enable, C_enable, IR_enable, Y_enable, MAR_enable,
					
					R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
					R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
					Zlowout, PCout, MDRout, Inportout, Cout,
					
					clk, MDR_read, pcInc, 
					
			input [31:0] Mdatain,
			input [4:0] op_code,
			output [31:0] busmuxout,
			output R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, IR,
			output [63:0] Z_register
					
					);
	
	wire clr;
	wire IR_out;
	wire [31:0] Y_data; //, Z_low_data, Z_high_data;
	
	// mux inputs (reg outputs) for 32-to-5 MUX
	wire [31:0] mux_in_r0, mux_in_r1, mux_in_r2, mux_in_r3, mux_in_r4, mux_in_r5, mux_in_r6, mux_in_r7,
				mux_in_r8, mux_in_r9, mux_in_r10, mux_in_r11, mux_in_r12, mux_in_r13, mux_in_r14, mux_in_r15,
				mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, mux_in_MDR, mux_in_inport, C_sign_extended, mux_in_IR, mux_in_MAR;
				
	// MUX output
	wire [31:0] bus_out;
	
	wire [63:0] alu_C_out;
	assign mux_in_Z_high = alu_C_out[63:32];
	assign mux_in_Z_low = alu_C_out[31:0];
	assign Z_register = {mux_in_Z_high, mux_in_Z_low};
	
	full_bus bus( 	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
					R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
					Zlowout, PCout, MDRout, Inportout, Cout, MARout,
					
					mux_in_r0, mux_in_r1, mux_in_r2, mux_in_r3, mux_in_r4, mux_in_r5, mux_in_r5, mux_in_r6, mux_in_r7,
					mux_in_r8, mux_in_r9, mux_in_r10, mux_in_r11, mux_in_r12, mux_in_r13, mux_in_r14, mux_in_r15, 
					mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, mux_in_MDR, mux_in_inport, C_sign_extended, mux_in_IR, mux_in_MAR,
					
					bus_out);
	
	//general purpose
	register r0(clr, clk, R0_enable, bus_out, mux_in_r0);
	register r1(clr, clk, R1_enable, bus_out, mux_in_r1);
	register r2(clr, clk, R2_enable, bus_out, mux_in_r2);
	register r3(clr, clk, R3_enable, bus_out, mux_in_r3);
	register r4(clr, clk, R4_enable, bus_out, mux_in_r4);
	register r5(clr, clk, R5_enable, bus_out, mux_in_r5);
	register r6(clr, clk, R6_enable, bus_out, mux_in_r6);
	register r7(clr, clk, R7_enable, bus_out, mux_in_r7);
	
	//arg registers
	register r8(clr, clk, R8_enable, bus_out, mux_in_r8);
	register r9(clr, clk, R9_enable, bus_out, mux_in_r9);
	register r10(clr, clk, R10_enable, bus_out, mux_in_r10);
	register r11(clr, clk, R11_enable, bus_out, mux_in_r11);
	
	// two return value registers
	register r12(clr, clk, R12_enable, bus_out, mux_in_r12);
	register r13(clr, clk, R13_enable, bus_out, mux_in_r13);
	
	// sp
	register r14(clr, clk, R14_enable, bus_out, mux_in_r14);
	
	// ra
	register r15(clr, clk, R15_enable, bus_out, mux_in_r15);
	
	//remainder and quotient of division OR high and low halves of product
	register r_hi(clr, clk, HI_enable, bus_out, mux_in_HI);
	register r_lo(clr, clk, LO_enable, bus_out, mux_in_LO);
	
	//two registers for 64 bit z register
	register r_zhigh(clr, clk, Zhigh_enable, bus_out, mux_in_Z_high);
	register r_zlow(clr, clk, Zlow_enable, bus_out, mux_in_Z_low);
	
	// instruction register
	register ir(clr, clk, IR_enable, bus_out, IR_out);
	
	// program counter
	pc pc_register(clr, clk, PC_enable, pcInc, bus_out, mux_in_PC);
	
	// Y register for ALU
	register y(clr, clk, Y_enable, bus_out, Y_data);
	
	// memory data register
	mdr mdr_register(clk, clr, MDR_enable, MDR_read, bus_out, Mdatain, MDRout); // MDRin -> write enable, read -> acts as select
	
	// memort address register
	register mar(clk, clr, MAR_enable, bus_out, mux_in_MAR);
	
	alu arithmetic(bus_out, bus_out, Y_data, Mdatain[31:27], Z_register)
	
	
endmodule