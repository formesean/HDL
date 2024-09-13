/*********************************************************
*	File: 				FourBitAdder.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		FourBitAdder.v Module
*********************************************************/

module FourBitAdder(A, B, C_in, S, C_out);

	input			[3:0] A, B;
	input 		C_in;
	output		[3:0] S;		
	output		C_out;
	wire			w1, w2, w3;
	
	// FullAdder (A, B, C_in, S, C_out);
	FullAdder	FA1(A[0], B[0], C_in, S[0], w1);
	FullAdder	FA2(A[1], B[1], w1, S[1], w2);
	FullAdder	FA3(A[2], B[2], w2, S[2], w3);
	FullAdder	FA4(A[3], B[3], w3, S[3], C_out);
	
endmodule
