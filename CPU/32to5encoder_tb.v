`timescale 1ns/10ps
module 32to5encoder_tb;

	reg[31:0] input_wires;
	
	wire[4:0] encoded_result;
	
	32_to_5_encoder encoder(input_wires, encoded_result);
	
	initial
		begin
		#200
			input_wires <= 32h1;
			
		#200 
			input_wires <= 32h2;
			
		#200 
			input_wires <= 32h4;	
			
		#200 
			input_wires <= 32h8;
			
		#200
			input_wires <= 32h10;
			
		#200 
			input_wires <= 32h20;
			
		#200 
			input_wires <= 32h40;	
			
		#200 
			input_wires <= 32h80;
			
		#200
			input_wires <= 32h100;
			
		#200 
			input_wires <= 32h200;
			
		#200 
			input_wires <= 32h400;	
			
		#200 
			input_wires <= 32h800;
			
		#200
			input_wires <= 32h1000;
			
		#200 
			input_wires <= 32h2000;
			
		#200 
			input_wires <= 32h4000;	
			
		#200 
			input_wires <= 32h8000;
		
		#200
			input_wires <= 32h10000;
			
		#200 
			input_wires <= 32h20000;
			
		#200 
			input_wires <= 32h40000;	
			
		#200 
			input_wires <= 32h80000;
		
		#200
			input_wires <= 32h100000;
			
		#200 
			input_wires <= 32h200000;
			
		#200 
			input_wires <= 32h400000;	
			
		#200 
			input_wires <= 32h800000; //invalid case
			
		end
	
endmodule

/*
32h1
32h2
32h4
32h8
32h10
32h20
32h40
32h80
32h100
32h200
32h400
32h800
32h1000
32h2000
32h4000
32h8000
32h10000
32h20000
32h40000
32h80000
32h100000
32h200000
32h400000
32h800000
*/
