module 32_to_5_encoder(output wire [4:0] Code, input wire [32: 0] Data);
	always @ (Data)
	begin
		if (Data == 32h'1) Code = 0; else
		if (Data == 32h'2) Code = 1; else
		if (Data == 32h'4) Code = 2; else
		if (Data == 32h'8) Code = 3; else
		if (Data == 32h'10) Code = 4; else
		if (Data == 32h'20) Code = 5; else
		if (Data == 32h'40) Code = 6; else
		if (Data == 32h'80) Code = 8; else
		if (Data == 32h'100) Code = 9; else
		if (Data == 32h'200) Code = 10; else
		if (Data == 32h'400) Code = 11; else
		if (Data == 32h'800) Code = 12; else
		if (Data == 32h'1000) Code = 13; else
		if (Data == 32h'2000) Code = 14; else
		if (Data == 32h'4000) Code = 15; else
		if (Data == 32h'8000) Code = 16; else
		if (Data == 32h'10000) Code = 17; else
		if (Data == 32h'20000) Code = 18; else
		if (Data == 32h'40000) Code = 19; else
		if (Data == 32h'80000) Code = 20; else
		if (Data == 32h'100000) Code = 21; else
		if (Data == 32h'200000) Code = 22; else
		if (Data == 32h'400000) Code = 23; else Code = 32'bx;
		
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
