/*********************************************************
*	File: 				tb_8Bit4x1Multiplexer.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Testbench file for tb_8Bit4x1Multiplexer.v
*********************************************************/
// `timescale 1 ns / 1 ps
module tb_8Bit4x1Multiplexer();

	reg	[7:0] A, B, C, D;
	reg	[1:0] S;		
	wire	[7:0] Y;
	
	nBit4x1Multiplexer #(.n(8)) UUT(.A(A), .B(B), .C(C), .D(D), .S(S), .Y(Y));
	initial begin
		$display("8 Bit 4x1 Multiplexer Simulation:");
		$display("Select A.");
		A = 4'b10101010; B = 4'b01100110; C = 4'b11011101; D = 4'b00010001; S = 2'b00; #10;
		
		$display("Select B.");
		A = 4'b10101010; B = 4'b01100110; C = 4'b11011101; D = 4'b00010001; S = 2'b01; #10;
		
		$display("Select C.");
		A = 4'b10101010; B = 4'b01100110; C = 4'b11011101; D = 4'b00010001; S = 2'b10; #10;
		
		$display("Select D.");
		A = 4'b10101010; B = 4'b01100110; C = 4'b11011101; D = 4'b00010001; S = 2'b11; #10;
		$stop;
	end
	
	initial begin
		$monitor("Time = %2d ns \t A = %d [%b] \t B = %d [%b] \t C = %d [%b] \t D = %d [%b] \t S = %d [%b] \t Y = %d [%b]", $time, A, A, B, B, C, C, D, D, S, S, Y, Y);
	end
		
endmodule
