/*********************************************************
*	File: 				tb_JK_FF.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Testbench file for JK_FF.v
*********************************************************/
`timescale 1 ns / 1 ps
module tb_JK_FF();
	reg J, K, nReset, Clk;
	wire Q, Qbar;
	
	JK_FF UUT(
		.J(J),
		.K(K),
		.nReset(nReset),
		.Clk(Clk),
		.Q(Q),
		.Qbar(Qbar)
	);
	
	initial 
		Clk = 1'b0;
		
	always
		#5 Clk = ~Clk;
		
	initial begin
		nReset = 1;
		#20 nReset = 0;
	end
	
	initial begin
		$display("Test Bench | JK FLIP FLOP...");
		
		J = 0; K = 0;

		#10 J = 0; K = 0; 
		#10 J = 0; K = 1; 
		#10 J = 1; K = 0; 
		#10 J = 1; K = 1;
		
		$stop;
	end
	
	initial begin
		$monitor("Time: %0t | Clk: %b | Reset: %b | J: %b | K: %b | Q: %b | ~Q: %b", $time, Clk, nReset, J, K, Q, ~Q);
	end
endmodule
