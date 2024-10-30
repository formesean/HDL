/*********************************************************
*	File: 				Decoder2x4.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Decoder2x4.v Module
*********************************************************/

module Decoder2x4 (
	input 	[1:0] A,
	input				E,
	output	[3:0] D
);
	wire		[1:0] W;
	
	not 		N1(W[0], A[0]);
	not 		N2(W[1], A[1]);
	and 		A0(D[0], W[0], W[1], E);
	and 		A1(D[1], W[1], A[0], E);
	and 		A2(D[2], A[1], W[0], E);
	and 		A3(D[3], A[0], A[1], E);

endmodule
