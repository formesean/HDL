/*********************************************************
*	File: 				FullAdder.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		FullAdder.v Module
*********************************************************/

module HalfAdder (x, y, C, S);

	input x, y;
	output C, S;

	xor X1 (S, x, y);
	and A1 (C, x, y);
	
endmodule

module FullAdder (A, B, C_in, S, C_out);

	input			A, B, C_in;
	output		C_out, S;
	wire 			w1, w2, w3;
	
	HalfAdder	HA1(A, B, w1, w2);
	HalfAdder	HA2(w2, C_in, w3, S);
	or			orGate(C_out, w1, w3);
	
endmodule