/*********************************************************
*	File: 				tb_ALU_n_bit.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Testbench file for ALU_n_bit.v
*********************************************************/
`timescale 1 ns / 1 ps
module tb_ALU_n_bit ();

	reg	[3:0] A, B;
	reg			CB_in;
	reg	[2:0] Mode;
	wire	[3:0] Result;
	wire			CB_out;
	
	ALU_n_bit #(.n(4)) UUT(.A(A), .B(B), .CB_in(CB_in), .Mode(Mode), .Result(Result), .CB_out(CB_out));
	initial begin
		$display("4 Bit ALU Simulation");
		$display("Addition with Carry...");
		Mode = 3'b000;    A = 4'b0001;    B = 4'b0000;    CB_in = 1'b0;    #10;    // 1 + 0 = 1   		|  00001
		Mode = 3'b000;    A = 4'b1110;    B = 4'b0010;    CB_in = 1'b0;    #10;    // 14 + 2 = 16 		|  10000
		Mode = 3'b000;    A = 4'b0010;    B = 4'b0100;    CB_in = 1'b0;    #10;    // 2 + 4 = 6   		|  001
	
		$display("Subtraction with Borrow...");
		Mode = 3'b001;    A = 4'b0000;    B = 4'b0001;    CB_in = 1'b0;    #10;    // 0 - 1 = 1   		|  1 0001
		Mode = 3'b001;    A = 4'b1110;    B = 4'b0010;    CB_in = 1'b0;    #10;    // 14 - 2 = 14 		|  0 1100
		Mode = 3'b001;    A = 4'b0010;    B = 4'b0100;    CB_in = 1'b0;    #10;    // 2 - 4 = 6   		|  1 0110

		$display("Bitwise AND of A and B...");
		Mode = 3'b010;    A = 4'b0000;    B = 4'b0001;    CB_in = 1'b0;    #10;    // 0 AND 1 = 0   	|  00000
		Mode = 3'b010;    A = 4'b1111;    B = 4'b0001;    CB_in = 1'b0;    #10;    // 15 AND 1 = 1	 	|  00001
		Mode = 3'b010;    A = 4'b0010;    B = 4'b0100;    CB_in = 1'b0;    #10;    // 2 AND 4 = 0   	|  00000

		$display("Bitwise OR of A and B...");
		Mode = 3'b011;    A = 4'b0000;    B = 4'b0001;    CB_in = 1'b0;    #10;    // 0 OR 1 = 1     	|  00000
		Mode = 3'b011;    A = 4'b1111;    B = 4'b0001;    CB_in = 1'b0;    #10;    // 15 OR 1 = 15	  	|  01111
		Mode = 3'b011;    A = 4'b0010;    B = 4'b0100;    CB_in = 1'b0;    #10;    // 2 OR 4 = 6     	|  00110

		$display("Bitwise XOR of A and B...");
		Mode = 3'b100;    A = 4'b0000;    B = 4'b0001;    CB_in = 1'b0;    #10;    // 0 XOR 1 = 1     |  00000
		Mode = 3'b100;    A = 4'b1111;    B = 4'b0001;    CB_in = 1'b0;    #10;    // 15 XOR 1 = 14	|  01110
		Mode = 3'b100;    A = 4'b0010;    B = 4'b0100;    CB_in = 1'b0;    #10;    // 2 XOR 4 = 6     |  00110

		$display("Complement of A...");
		Mode = 3'b101;    A = 4'b0000;    B = 4'b0000;    CB_in = 1'b0;    #10;    // 0 = 15  			|  01111
		Mode = 3'b101;    A = 4'b1111;    B = 4'b0000;    CB_in = 1'b0;    #10;    // 15 = 0	 			|  00000
		Mode = 3'b101;    A = 4'b0010;    B = 4'b0000;    CB_in = 1'b0;    #10;    // 2 = 13  			|	01101

		$display("Increment A...");
		Mode = 3'b110;    A = 4'b0000;    B = 4'b0000;    CB_in = 1'b0;    #10;    // 0 = 1   			|  00001
		Mode = 3'b110;    A = 4'b1111;    B = 4'b0000;    CB_in = 1'b0;    #10;    // 15 = 16 			|  10000
		Mode = 3'b110;    A = 4'b0010;    B = 4'b0000;    CB_in = 1'b0;    #10;    // 2 = 3   			|  00011

		$display("Decrement A...");
		Mode = 3'b111;    A = 4'b0000;    B = 4'b0000;    CB_in = 1'b0;    #10;    // 0 = 1   |  00001
		Mode = 3'b111;    A = 4'b1111;    B = 4'b0000;    CB_in = 1'b0;    #10;    // 15 = 14 |  01110
		Mode = 3'b111;    A = 4'b0010;    B = 4'b0000;    CB_in = 1'b0;    #10;    // 2 = 1   |  00001

		$stop;
	end
	
	initial begin
		$monitor("Time = %2d ns | Mode = %b | A = %b | B = %b | CB_in = %b | Result = %b | CB_out = %b", $time, Mode, A, B, CB_in, Result, CB_out);
	end

endmodule