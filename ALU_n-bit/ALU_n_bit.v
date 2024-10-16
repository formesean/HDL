/*********************************************************
*	File: 				ALU_n_bit.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		ALU_n_bit.v Module
*********************************************************/

/*****************************
*	Mode 		Operation
*	000 		Addition (A + B) with carry		0
*	001 		Subtract (A – B) with borrow		1
*	010 		Bitwise AND of A and B				2
*	011 		Bitwise OR of A and B				3
*	100 		Bitwise XOR of A and B				4
*	101 		Complement of A						5
*	110 		Increment A								6
*	111 		Decrement A								7
*****************************/

module ALU_n_bit
#(parameter n = 4)
(
	input 		[(n-1):0] A, B, 
	input			CB_in,
	input			[2:0] Mode,
	output reg 	[(n-1):0] Result,
	output reg	CB_out
);
	
	always @(*)
	begin
		case (Mode)
			3'b000 :	
				begin
					Result = A + B + CB_in;
					CB_out = Result > ((2**n) - 1);
				end
			3'b001 :
				begin
					Result = ((A + CB_in) < B) ? (B - (A + CB_in)) : ((A + CB_in) - B);
					CB_out = ((A + CB_in) < B) ? 1'b1 : 1'b0;
				end
			3'b010 :
				begin
					Result = A & B;
					CB_out = 0;
				end
			3'b011 :
				begin
					Result = A | B;
					CB_out = 0;
				end
			3'b100 :
				begin
					Result = (A ^ B);
					CB_out = 0;
				end
			3'b101 :
				begin
					Result = ~A;
					CB_out = 0;
				end
			3'b110 :
				begin
					Result = A + 1;
					CB_out = (A == ((2**n) - 1));
				end
			3'b111 :
				begin
					Result = (A < 1) ? (1 - A) : (A - 1);
					CB_out = (A < 1) ? 1'b1 : 1'b0;
				end
		endcase
	end
	
endmodule
