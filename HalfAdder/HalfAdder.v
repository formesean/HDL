//
// Verilog HDL code for a half adder circuit
//
module HalfAdder (x, y, C, S);

	input x, y;
	output C, S;

	xor X1 (S, x, y);
	and A1 (C, x, y);
	
endmodule