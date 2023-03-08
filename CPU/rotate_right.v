module rotate_right(input wire [31:0] a, b, output reg [31:0] result);
	reg [4:0] bits;
	
	always @(*) begin
		bits = a % 32; // this tells us how many bits to rotate by (because we don't actually need to rotate b times, that would be redundant for b > 32)
		case (bits)
			5'b00000:
				result <= a;
			5'b11111:
				result <= {a[30:0],a[31]};
			5'b11110:
				result <= {a[29:0],a[31:30]};
			5'b11101:
				result <= {a[28:0],a[31:29]};
			5'b11100:
				result <= {a[27:0],a[31:28]};
			5'b11011:
				result <= {a[26:0],a[31:27]};	
			5'b11010:
				result <= {a[25:0],a[31:26]};
			5'b11001:
				result <= {a[24:0],a[31:25]};
			5'b11000:
				result <= {a[23:0],a[31:24]};
			5'b10111:
				result <= {a[22:0],a[31:23]};
			5'b10110:
				result <= {a[21:0],a[31:22]};
			5'b10101:
				result <= {a[20:0],a[31:21]};
			5'b10100:
				result <= {a[19:0],a[31:20]};
			5'b10011:
				result <= {a[18:0],a[31:19]};
			5'b10010:
				result <= {a[17:0],a[31:18]};
			5'b10001:
				result <= {a[16:0],a[31:17]};
			5'b10000:
				result <= {a[15:0],a[31:16]};
			5'b01111:
				result <= {a[14:0],a[31:15]};
			5'b01110:
				result <= {a[13:0],a[31:14]};
			5'b01101:
				result <= {a[12:0],a[31:13]};
			5'b01100:
				result <= {a[11:0],a[31:12]};		
			5'b01011:
				result <= {a[10:0],a[31:11]};
			5'b01010:
				result <= {a[9:0],a[31:10]};
			5'b01001:
				result <= {a[8:0],a[31:9]};
			5'b01000:
				result <= {a[7:0],a[31:8]};
			5'b00111:
				result <= {a[6:0],a[31:7]};
			5'b00110:
				result <= {a[5:0],a[31:6]};
			5'b00101:
				result <= {a[4:0],a[31:5]};
			5'b00100:
				result <= {a[3:0],a[31:4]};
			5'b00011:
				result <= {a[2:0],a[31:3]};
			5'b00010:
				result <= {a[1:0],a[31:2]};
			5'b00001:
				result <= {a[0],a[31:1]};
			default:
				result <= 32'bx;
		endcase
	end
endmodule