module _32to5encoder(
	input [31:0] R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
			R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
			Zlowout, PCout, MDRout, Inportout, Cout,
			
	output reg [4:0] S0, S1, S2, S3, S4
	);
			
		
	always @ (R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
			R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
			Zlowout, PCout, MDRout, Inportout, Cout)
	begin
		if (R0out == 1) begin 
			S4 <= 0;
			S3 <= 0;
			S2 <= 0;
			S1 <= 0;
			S0 <= 0;
		end else if (R1out == 1) begin
			S4 <= 0;
			S3 <= 0;
			S2 <= 0;
			S1 <= 0;
			S0 <= 1;
		end else if (R2out == 1) begin
			S4 <= 0;
			S3 <= 0;
			S2 <= 0;
			S1 <= 1;
			S0 <= 0;
		end else if (R3out == 1) begin
			S4 <= 0;
			S3 <= 0;
			S2 <= 0;
			S1 <= 1;
			S0 <= 1;
		end else if (R4out == 1) begin
			S4 <= 0;
			S3 <= 0;
			S2 <= 1;
			S1 <= 0;
			S0 <= 0;
		end else if (R5out == 1) begin
			S4 <= 0;
			S3 <= 0;
			S2 <= 1;
			S1 <= 0;
			S0 <= 1;
		end else if (R6out == 1) begin
			S4 <= 0;
			S3 <= 0;
			S2 <= 1;
			S1 <= 1;
			S0 <= 0;
		end else if (R7out == 1) begin
			S4 <= 0;
			S3 <= 0;
			S2 <= 1;
			S1 <= 1;
			S0 <= 1;
		end else if (R8out == 1) begin
			S4 <= 0;
			S3 <= 1;
			S2 <= 0;
			S1 <= 0;
			S0 <= 0;
		end else if (R9out == 1) begin
			S4 <= 0;
			S3 <= 1;
			S2 <= 0;
			S1 <= 0;
			S0 <= 1;
		end else if (R10out == 1) begin
			S4 <= 0;
			S3 <= 1;
			S2 <= 0;
			S1 <= 1;
			S0 <= 0;
		end else if (R11out == 1) begin
			S4 <= 0;
			S3 <= 1;
			S2 <= 0;
			S1 <= 1;
			S0 <= 1;
		end else if (R12out == 1) begin
			S4 <= 0;
			S3 <= 1;
			S2 <= 1;
			S1 <= 0;
			S0 <= 0;
		end else if (R13out == 1) begin
			S4 <= 0;
			S3 <= 1;
			S2 <= 1;
			S1 <= 0;
			S0 <= 1;
		end else if (R14out == 1) begin
			S4 <= 0;
			S3 <= 1;
			S2 <= 1;
			S1 <= 1;
			S0 <= 0;
		end else if (R15out == 1) begin
			S4 <= 0;
			S3 <= 1;
			S2 <= 1;
			S1 <= 1;
			S0 <= 1;
		end else if (HIout == 1) begin
			S4 <= 1;
			S3 <= 0;
			S2 <= 0;
			S1 <= 0;
			S0 <= 0;
		end else if (LOout == 1) begin
			S4 <= 1;
			S3 <= 0;
			S2 <= 0;
			S1 <= 0;
			S0 <= 1;
		end else if (Zhighout == 1) begin
			S4 <= 1;
			S3 <= 0;
			S2 <= 0;
			S1 <= 1;
			S0 <= 0;
		end else if (Zlowout == 1) begin
			S4 <= 1;
			S3 <= 0;
			S2 <= 0;
			S1 <= 1;
			S0 <= 1;
		end else if (MDRout == 1) begin
			S4 <= 1;
			S3 <= 0;
			S2 <= 1;
			S1 <= 0;
			S0 <= 0;
		end else if (Inportout == 1) begin
			S4 <= 1;
			S3 <= 0;
			S2 <= 1;
			S1 <= 0;
			S0 <= 1;
		end else if (Cout == 1) begin
			S4 <= 1;
			S3 <= 0;
			S2 <= 1;
			S1 <= 1;
			S0 <= 0;
		end else begin
			S4 = 'bx;
			S3 = 'bx;
			S2 = 'bx;
			S1 = 'bx;
			S0 = 'bx;
		end
		
		//THE SIGNALS BELOW ARE NOT NEEDED, GIVEN WE ONLY HAVE 24 REGISTERS
		//if (Data == h'800000) Code = 24; else
		//if (Data == h'1000000) Code = 25; else
		//if (Data == h'2000000) Code = 26; else
		//if (Data == h'4000000) Code = 27; else
		//if (Data == h'8000000) Code = 28; else
		//if (Data == h'10000000) Code = 29; else
		//if (Data == h'20000000) Code = 30; else
		//if (Data == h'40000000) Code = 31; else
		//if (Data == h'80000000) Code = 32; else
	end
	
endmodule

//run test bench for every module
