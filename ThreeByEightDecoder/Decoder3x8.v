/*********************************************************
*	File: 				Decoder3x8.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Decoder3x8.v Module
*********************************************************/

module Decoder3x8 (
	input		[2:0] A,
	input				E,
	output	[7:0] D
);

	Decoder2x4 Dc2x4_1(.A(A[1:0]), .E(E & ~A[2]), .D(D[7:4]));

	Decoder2x4 Dc2x4_2(.A(A[1:0]), .E(E & ~A[2]), .D(D[3:0]));

endmodule
