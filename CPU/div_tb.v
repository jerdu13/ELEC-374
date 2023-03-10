// and datapath_tb.v file: <This is the filename>
`timescale 1ns/10ps
module div_tb;
	reg R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;
	reg R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
	reg PCin, HIin, LOin, ZHIin, ZLOin, MDRin, Inportin, Cin, IRin, Yin, MARin;
	reg PCout, HIout, LOout, ZHIout, ZLOout, MDRout, Inportout, Cout;
	reg Clock, MDRread, IncPC;
	reg [4:0] OP;
	reg [31:0] MDatain;
	wire [31:0] BusMuxOut;
	
	wire [63:0] Zreg;
	
	parameter 	Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
					Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111,
					T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101;
	reg [3:0] Present_state = Default;

cpu DUT(.R0_enable(R0in), .R1_enable(R1in), .R2_enable(R2in), .R3_enable(R3in), .R4_enable(R4in), .R5_enable(R5in), .R6_enable(R6in), .R7_enable(R7in), .R8_enable(R8in), 
					.R9_enable(R9in), .R10_enable(R10in), .R11_enable(R11in), .R12_enable(R12in), .R13_enable(R13in), .R14_enable(R14in), .R15_enable(R15in), .HI_enable(HIin), .LO_enable(LOin),
					.Zhigh_enable(ZHIin), .Zlow_enable(ZLOin), .PC_enable(PCin), .MDR_enable(MDRin), .Inport_enable(Inportin), .C_enable(Cin), .IR_enable(IRin), .Y_enable(Yin), .MAR_enable(MARin),
					
					.R0out(R0out), .R1out(R1out), .R2out(R2out), .R3out(R3out), .R4out(R4out), .R5out(R5out), .R6out(R6out), .R7out(R7out), .R8out(R8out), .R9out(R9out),
					.R10out(R10out), .R11out(R11out), .R12out(R12out), .R13out(R13out), .R14out(R14out), .R15out(R15out), .HIout(HIout), .LOout(LOout), .Zhighout(ZHIout),
					.Zlowout(ZLOout), .PCout(PCout), .MDRout(MDRout), .Inportout(Inportout), .Cout(Cout),
					
					.clk(Clock), .MDR_read(MDRread), .pcInc(IncPC), 
					
					.Mdatain(MDatain), .op_code(OP), .bus_out(BusMuxOut), .Z_register(Zreg));


// add test logic here
initial
	begin
		Clock = 0;
		forever #10 Clock = ~ Clock;
	end

always @(posedge Clock) // finite state machine; if clock rising-edge
	begin
		case (Present_state)
			Default : Present_state = Reg_load1a;
			Reg_load1a : Present_state = Reg_load1b;
			Reg_load1b : Present_state = Reg_load2a;
			Reg_load2a : Present_state = Reg_load2b;
			Reg_load2b : Present_state = T0;
			T0 : Present_state = T1;
			T1 : Present_state = T2;
			T2 : Present_state = T3;
			T3 : Present_state = T4;
			T4 : Present_state = T5;
			T5 : Present_state = T6;
		endcase
	end

always @(Present_state) // do the required job in each state

	begin
		case (Present_state) // assert the required signals in each clock cycle
			Default: begin
				PCout <= 0; ZLOout <= 0; MDRout <= 0; // initialize the signals
				R6out <= 0; R7out <= 0; ZLOout <= 0; ZHIout <= 0; LOin <= 0; HIin <= 0; MARin <= 0; ZLOin <= 0; ZHIin <= 0;
				PCin <=0; MDRin <= 0; IRin <= 0; Yin <= 0;
				IncPC <= 0; MDRread <= 0; OP <= 0;
				R6in <= 0; R7in <= 0; MDatain <= 32'h00000000;
			end
			Reg_load1a: begin
				MDatain <= 32'h00000012;
				MDRread = 0; MDRin = 0; // the first zero is there for completeness
				#10 MDRread <= 1; MDRin <= 1;
				#10 MDRread <= 0; MDRin <= 0;
			end
			Reg_load1b: begin
				#10 MDRout <= 1; R6in <= 1;
				#10 MDRout <= 0; R6in <= 0; // initialize R2 with the value $12
			end
			Reg_load2a: begin
				MDatain <= 32'h00000014;
				#10 MDRread <= 1; MDRin <= 1;
				#10 MDRread <= 0; MDRin <= 0;
			end
			Reg_load2b: begin
				#10 MDRout <= 1; R7in <= 1;
				#10 MDRout <= 0; R7in <= 0; // initialize R3 with the value $14
			end

			T0: begin // see if you need to de-assert these signals
				#10 MARin <= 1; IncPC <= 1; ZLOin <= 1; PCout <= 1;
				#10 MARin <= 0; ZLOin <= 0; PCout <= 0; //IncPC <= 0;
			end

			T1: begin
				MDatain <= 32'h83380000; // opcode for “div r6, r7”
				#10 MDRread <= 1; MDRin <= 1; ZLOout <= 1; PCin <= 1; 
				#10 MDRread <= 0; MDRin <= 0; ZLOout <= 0; PCin <= 0; IncPC <= 0;
			end
			
			T2: begin
				#10 MDRout <= 1; IRin <= 1;
				#10 MDRout <= 0; IRin <= 0;
			end
			
			T3: begin
				#10 R6out <= 1; Yin <= 1;
				#10 R6out <= 0; Yin <= 0;
			end

			T4: begin
				#10 R7out <= 1; OP <= 5'b10000; ZLOin <= 1; ZHIin <= 1;
				#10 R7out <= 0; OP <= 5'b00000; ZLOin <= 0; ZHIin <= 1;
			end

			T5: begin
				#10 ZLOout <= 1; LOin <= 1;
				#10 ZLOout <= 0; LOin <= 0;
			end
			
			T6: begin
				#10 ZHIout <= 1; HIin <= 1;
				#10 ZHIout <= 0; HIin <= 0;
			end
		endcase

	end
	
endmodule
