/*********************************************************
*	File: 				tb_Hex_to_7seg_Decoder.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Testbench file for tb_Hex_to_7seg_Decoder.v
*********************************************************/
`timescale 1 ns / 1 ps
module tb_Hex_to_7seg_Decoder();

	reg			[3:0] Hex;
	reg					DP;
	wire			[7:0] SSeg;
	
	Hex_to_7seg_Decoder UUT(.Hex(Hex), .DP(DP), .SSeg(SSeg));
	initial begin
		$display("Hex to 7 Segment Decoder Simulation:");
		$display("DP is OFF...");
		DP = 1'b0;
			Hex = 4'b0000;
			repeat(16)
			#10	Hex = Hex + 4'b0001;
		
		$display("DP is ON...");
		DP = 1'b1;
			Hex = 4'h00;
			repeat(16)
			#10	Hex = Hex + 4'b0001;

		$stop;
	end
	
	initial begin
		$monitor("Time = %2d ns | DP = %b | HEX = %b | SSeg = %b", $time, DP, Hex, SSeg);
	end
		
endmodule
