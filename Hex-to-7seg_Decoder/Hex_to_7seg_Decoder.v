/*********************************************************
*	File: 				Hex-to-7seg_Decoder.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Hex-to-7seg_Decoder.v Module
*********************************************************/
module Hex_to_7seg_Decoder(
	input			[3:0] Hex,
	input					DP,
	output reg	[7:0] SSeg
);

	always @(*)
	begin
		case ({DP, Hex})
			// DP HEX - A B C D E F G DP
			// 0 = ON
			// 1 = OFF
			
			5'b00000 : SSeg = 8'b00000011;
			5'b00001 : SSeg = 8'b10011111;
			5'b00010 : SSeg = 8'b00100101;
			5'b00011 : SSeg = 8'b00001101;
			5'b00100 : SSeg = 8'b10011001;
			5'b00101 : SSeg = 8'b01001001;
			5'b00110 : SSeg = 8'b01000001;
			5'b00111 : SSeg = 8'b00011111;
			5'b01000 : SSeg = 8'b00000001;
			5'b01001 : SSeg = 8'b00001001;
			5'b01010 : SSeg = 8'b00010001;
			5'b01011 : SSeg = 8'b11000001;
			5'b01100 : SSeg = 8'b01100011;
			5'b01101 : SSeg = 8'b10000101;
			5'b01110 : SSeg = 8'b01100001;
			5'b01111 : SSeg = 8'b01110001;
			
			5'b10000 : SSeg = 8'b00000010;
			5'b10001 : SSeg = 8'b10011110;
			5'b10010 : SSeg = 8'b00100100;
			5'b10011 : SSeg = 8'b00001100;
			5'b10100 : SSeg = 8'b10011000;
			5'b10101 : SSeg = 8'b01001000;
			5'b10110 : SSeg = 8'b01000000;
			5'b10111 : SSeg = 8'b00011110;
			5'b11000 : SSeg = 8'b00000000;
			5'b11001 : SSeg = 8'b00001000;
			5'b11010 : SSeg = 8'b00010000;
			5'b11011 : SSeg = 8'b11000000;
			5'b11100 : SSeg = 8'b01100010;
			5'b11101 : SSeg = 8'b10000100;
			5'b11110 : SSeg = 8'b01100000;
			5'b11111 : SSeg = 8'b01110000;
		endcase
	end

endmodule
