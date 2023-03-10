module full_bus(
	input 				R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
						R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
						Zlowout, PCout, MDRout, Inportout, Cout,
			
	input wire [31:0] 	mux_in_r0, mux_in_r1, mux_in_r2, mux_in_r3, mux_in_r4, mux_in_r5, mux_in_r6, mux_in_r7,
						mux_in_r8, mux_in_r9, mux_in_r10, mux_in_r11, mux_in_r12, mux_in_r13, mux_in_r14, mux_in_r15, 
						mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, mux_in_MDR, mux_in_inport, C_sign_extended, mux_in_IR, mux_in_MAR,
	
	output reg [31:0] bus_out
	);
			
	reg [4:0] select;
	
	//reg [31:0] mux_out;
	//assign bus_out = mux_out;
		
	always @ (R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
			R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
			Zlowout, PCout, MDRout, Inportout, Cout)
	begin
		if (R0out == 1) begin 
			select <= 5'b00000;
		end else if (R1out == 1) begin
			select <= 5'b00001;
		end else if (R2out == 1) begin
			select <= 5'b00010;
		end else if (R3out == 1) begin
			select <= 5'b00011;
		end else if (R4out == 1) begin
			select <= 5'b00100;
		end else if (R5out == 1) begin
			select <= 5'b00101;
		end else if (R6out == 1) begin
			select <= 5'b00110;
		end else if (R7out == 1) begin
			select <= 5'b00111;
		end else if (R8out == 1) begin
			select <= 5'b01000;
		end else if (R9out == 1) begin
			select <= 5'b01001;
		end else if (R10out == 1) begin
			select <= 5'b01010;
		end else if (R11out == 1) begin
			select <= 5'b01011;
		end else if (R12out == 1) begin
			select <= 5'b01100;
		end else if (R13out == 1) begin
			select <= 5'b01101;
		end else if (R14out == 1) begin
			select <= 5'b01110;
		end else if (R15out == 1) begin
			select <= 5'b01111;
		end else if (HIout == 1) begin
			select <= 5'b10000;
		end else if (LOout == 1) begin
			select <= 5'b10001;
		end else if (Zhighout == 1) begin
			select <= 5'b10010;
		end else if (Zlowout == 1) begin
			select <= 5'b10011;
		end else if (PCout == 1) begin
			select <= 5'b10100;
		end else if (MDRout == 1) begin
			select <= 5'b10101;
		end else if (Inportout == 1) begin
			select <= 5'b10110;
		end else if (Cout == 1) begin
			select <= 5'b10111;
		end else begin
			select <= 5'bxxxxx;
		end
		
	end
	
	always @(select)
	begin
		case(select)
			5'b00000 : bus_out = mux_in_r0;
			5'b00001 : bus_out = mux_in_r1;
			5'b00010 : bus_out = mux_in_r2;
			5'b00011 : bus_out = mux_in_r3;
			5'b00100 : bus_out = mux_in_r4;
			5'b00101 : bus_out = mux_in_r5;
			5'b00110 : bus_out = mux_in_r6;
			5'b00111 : bus_out = mux_in_r7;
			5'b01000 : bus_out = mux_in_r8;
			5'b01001 : bus_out = mux_in_r9;
			5'b01010 : bus_out = mux_in_r10;
			5'b01011 : bus_out = mux_in_r11;
			5'b01100 : bus_out = mux_in_r12;
			5'b01101 : bus_out = mux_in_r13;
			5'b01110 : bus_out = mux_in_r14;
			5'b01111 : bus_out = mux_in_r15;
			5'b10000 : bus_out = mux_in_HI;
			5'b10001 : bus_out = mux_in_LO;
			5'b10010 : bus_out = mux_in_Z_high;
			5'b10011 : bus_out = mux_in_Z_low;
			5'b10100 : bus_out = mux_in_PC;
			5'b10101 : bus_out = mux_in_MDR;
			5'b10110 : bus_out = mux_in_inport;
			5'b10111 : bus_out = C_sign_extended;
			default	: bus_out = 32'bx;
		endcase
	end
	
endmodule

//run test bench for every module
