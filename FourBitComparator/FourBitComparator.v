/*********************************************************
*	File: 				FourBitComparator.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		FourBitComparator.v Module
*********************************************************/
module FourBitComparator(
	input 	[3:0] A,
	input 	[3:0] B,
	output 	[2:0] R
);

	assign R[2] = (A > B) ? 1'b1 : 1'b0;
	assign R[1] = (A == B) ? 1'b1 : 1'b0;
	assign R[0] = (A < B) ? 1'b1 : 1'b0;	
	
endmodule