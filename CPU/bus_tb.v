module bus_tb();
	
	reg clk;
	
	parameter 	s0 = 5'b0000, s1 = 5'b0000, s2 = 5'b0000, s3 = 5'b0000, s4 = 5'b0000, s5 = 5'b0000, s6 = 5'b0000, s7 = 5'b0000, 
				s8 = 5'b0000, s9 = 5'b0000, s10 = 5'b0000, s11 = 5'b0000, s12 = 5'b0000, s13 = 5'b0000, s14 = 5'b0000, s15 = 5'b0000, 
				s16 = 5'b0000, s17 = 5'b0000, s18 = 5'b0000, s19 = 5'b0000, s20 = 5'b0000, s21 = 5'b0000, s22 = 5'b0000, s23 = 5'b0000; 
				
	reg [5:0] current_state, next_state;
	
	// register outputs for MUX select
	reg R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
		R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
		Zlowout, PCout, MDRout, Inportout, Cout;
			
	// mux inputs for 32-to-5 MUX
	wire [31:0] mux_in_r0, mux_in_r1, mux_in_r2, mux_in_r3, mux_in_r4, mux_in_r5, mux_in_r5, mux_in_r6, mux_in_r7,
				mux_in_r8, mux_in_r9, mux_in_r10, mux_in_r11, mux_in_r12, mux_in_r13, mux_in_r14, mux_in_r15, 
				mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, mux_in_MDR, mux_in_inport, C_sign_extended;
				
	// MUX output
	wire [31:0] bus_out;
	
	bus test_bus( 	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
					R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
					Zlowout, PCout, MDRout, Inportout, Cout,
					
					mux_in_r0, mux_in_r1, mux_in_r2, mux_in_r3, mux_in_r4, mux_in_r5, mux_in_r5, mux_in_r6, mux_in_r7,
					mux_in_r8, mux_in_r9, mux_in_r10, mux_in_r11, mux_in_r12, mux_in_r13, mux_in_r14, mux_in_r15, 
					mux_in_HI, mux_in_LO, mux_in_Z_high, mux_in_Z_low, mux_in_PC, mux_in_MDR, mux_in_inport, C_sign_extended,
					
					bus_out);
	
	// simulate the clock from the start, set initial state in fsm to s0
	initial begin
		clk <= 0;
		
		R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
		R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
		Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
		
		mux_in_r0 <= 32'b00000000000000000000000000000001;
		mux_in_r1 <= 32'b00000000000000000000000000000010;
		mux_in_r2 <= 32'b00000000000000000000000000000100;
		mux_in_r3 <= 32'b00000000000000000000000000001000;
		mux_in_r4 <= 32'b00000000000000000000000000010000;
		mux_in_r5 <= 32'b00000000000000000000000000100000;
		mux_in_r5 <= 32'b00000000000000000000000001000000;
		mux_in_r6 <= 32'b00000000000000000000000010000000;
		mux_in_r7 <= 32'b00000000000000000000000100000000;
		mux_in_r8 <= 32'b00000000000000000000001000000000;
		mux_in_r9 <= 32'b00000000000000000000010000000000;
		mux_in_r10 <= 32'b00000000000000000000100000000000;
		mux_in_r11 <= 32'b00000000000000000001000000000000;
		mux_in_r12 <= 32'b00000000000000000010000000000000;
		mux_in_r13 <= 32'b00000000000000000100000000000000;
		mux_in_r14 <= 32'b00000000000000001000000000000000;
		mux_in_r15 <= 32'b00000000000000010000000000000000;
		mux_in_HI <= 32'b00000000000000100000000000000000;
		mux_in_LO <= 32'b00000000000001000000000000000000;
		mux_in_Z_high <= 32'b00000000000010000000000000000000;
		mux_in_Z_low <= 32'b00000000000100000000000000000000;
		mux_in_PC <= 32'b00000000001000000000000000000000;
		mux_in_MDR <= 32'b00000000010000000000000000000000;
		mux_in_inport <= 32'b00000000100000000000000000000000;
		C_sign_extended <= 32'b00000001000000000000000000000000;
		
		
		 <= 32'b00000000000000000000000000000000;
		
		
		
		current_state <= s0;
		
		always #10 clk = ~clk;
	end
	
	always @(posedge clk) begin
		case(current_state)
			s0: begin
				#50 
				R0out <= 1; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;

			end
			
			s1: begin
				#50 
				R0out <= 0; R1out <= 1; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;

			end
			
			s2: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 1; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s3: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 1; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s4: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 1; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s5: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 1; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s6: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 1; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s7: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 1; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s8: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 1; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s9: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 1;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s10: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 1; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s11: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 1; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s12: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 1; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s13: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 1; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s14: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 1; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s15: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 1; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s16: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 1; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
			end
			
			s17: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 1; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s18: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 1;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s19: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 1; PCout <= 0; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s20: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 1; MDRout <= 0; Inportout <= 0; Cout <= 0;
				
			end
			
			s21: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 1; Inportout <= 0; Cout <= 0;
				
			end
			
			s22: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 1; Cout <= 0;
				
			end
			
			s23: begin
				#50 
				R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
				R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0; HIout <= 0; LOout <= 0; Zhighout <= 0;
				Zlowout <= 0; PCout <= 0; MDRout <= 0; Inportout <= 1; Cout <= 0;
				
			end
			
		endcase
		
		if (current_state != s23) begin
			next_state <= current_state + 1;
		end
		
	end
	
	always @ (next_state) begin
		current_state <= next_state;
	end
	
	
	
endmodule