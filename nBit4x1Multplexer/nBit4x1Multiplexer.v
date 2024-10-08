/*********************************************************
*	File: 				nBit4x1Multiplexer.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		nBit4x1Multiplexer.v Module
*********************************************************/
module nBit4x1Multiplexer
#(parameter n = 4)
(
	input 	[(n-1):0] A, B, C, D,
	input		[1:0] S,
	output 	[(n-1):0] Y
);

	assign Y = (S == 2'b00) ? A : (S == 2'b01) ? B : (S == 2'b10) ? C : (S == 2'b11) ? D : {n{1'b0}};
	
endmodule