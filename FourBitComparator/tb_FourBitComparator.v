/*********************************************************
*	File: 				tb_FourBitComparator.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Testbench file for tb_FourBitComparator.v
*********************************************************/
`timescale 1 ns / 1 ps
module tb_FourBitComparator();
	reg	[3:0] A, B;	
	wire	[2:0] R;
	
	FourBitComparator UUT(.A(A), .B(B), .R(R));
	initial begin
		$display("Four Bit Comparator Simulation:");
		// Test cases for A < B
		$display("A < B");
		A = 4'b0100; B = 4'b1010; #10;
		A = 4'b1100; B = 4'b1111; #10;
		A = 4'b0010; B = 4'b1101; #10;
		A = 4'b0011; B = 4'b1101; #10;
		  
		// Test cases for A = B
		$display("A = B");
		A = 4'b1110; B = 4'b1110; #10;
		A = 4'b1111; B = 4'b1111; #10;
		A = 4'b1000; B = 4'b1000; #10;
		A = 4'b0000; B = 4'b0000; #10;
		  
		// Test cases for A > B
		$display("A > B");
		A = 4'b0001; B = 4'b0000; #10;
		A = 4'b1111; B = 4'b1110; #10;
		A = 4'b0101; B = 4'b0011; #10;
		A = 4'b0010; B = 4'b0001; #10;
		$stop;
	end
	initial begin
		$monitor("Time = %2d ns\t A = %d | [%b]\t B = %d [%b]\t R = %b", $time, A, A, B, B, R);
	end
		
endmodule
