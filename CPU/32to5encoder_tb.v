`timescale 1ns/10ps
module _32to5encoder_tb();

	reg[31:0] input_wires;
	
	wire[4:0] encoded_result;
	
	_32to5encoder encoder(input_wires, encoded_result);
	
	initial
		begin
		#100
			input_wires <= 32'h1;
			
		#100 
			input_wires <= 32'h2;
			
		#100 
			input_wires <= 32'h4;	
			
		#100 
			input_wires <= 32'h8;
			
		#100
			input_wires <= 32'h10;
			
		#100 
			input_wires <= 32'h20;
			
		#100 
			input_wires <= 32'h40;	
			
		#100 
			input_wires <= 32'h80;
			
		#100
			input_wires <= 32'h100;
			
		#100 
			input_wires <= 32'h200;
			
		#100 
			input_wires <= 32'h400;	
			
		#100 
			input_wires <= 32'h800;
			
		#100
			input_wires <= 32'h1000;
			
		#100 
			input_wires <= 32'h2000;
			
		#100 
			input_wires <= 32'h4000;	
			
		#100 
			input_wires <= 32'h8000;
		
		#100
			input_wires <= 32'h10000;
			
		#100 
			input_wires <= 32'h20000;
			
		#100 
			input_wires <= 32'h40000;	
			
		#100 
			input_wires <= 32'h80000;
		
		#100
			input_wires <= 32'h100000;
			
		#100 
			input_wires <= 32'h200000;
			
		#100 
			input_wires <= 32'h400000;	
			
		#100 
			input_wires <= 32'h800000; //invalid case
			
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
