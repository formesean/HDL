/*********************************************************
*	File: 				tb_Decoder3x8.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Testbench file for Decoder3x8.v
*********************************************************/
`timescale 1 ns / 1 ps
module tb_Decoder3x8();

	reg	[2:0] A;
	reg			E;		
	wire	[7:0] D;
	
	Decoder3x8 UUT(A[2:0], E, D[7:0]);
	initial begin
		$display("Decoder 3x8 Simulation:");
		$display("Enable STATUS [OFF].");
		E = 1'b0;	A = 3'b000;			#10
		E = 1'b0;	A = 3'b001;			#10
		E = 1'b0;	A = 3'b010;			#10
		E = 1'b0;	A = 3'b011;			#10
		E = 1'b0;	A = 3'b100;			#10
		E = 1'b0;	A = 3'b101;			#10
		E = 1'b0;	A = 3'b110;			#10
		E = 1'b0;	A = 3'b111;			#10
		
		$display("Enable STATUS [ON].");
		E = 1'b1;	A = 3'b000;			#10
		E = 1'b1;	A = 3'b001;			#10
		E = 1'b1;	A = 3'b010;			#10
		E = 1'b1;	A = 3'b011;			#10
		E = 1'b1;	A = 3'b100;			#10
		E = 1'b1;	A = 3'b101;			#10
		E = 1'b1;	A = 3'b110;			#10
		E = 1'b1;	A = 3'b111;			#10
		$stop;
	end
	
	initial begin
		$monitor("Time = %d ns \t E = %1b \t A = %3b \t D = %8b", $time, E, A, D);
	end
		
endmodule
