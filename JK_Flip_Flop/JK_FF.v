/*********************************************************
*	File: 				JK_FF.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		JK_FF.v Module
*********************************************************/
module JK_FF(
	input wire J, K, nReset, Clk,
	output reg Q, Qbar   
);

always @(negedge Clk, posedge nReset)
begin
	if (nReset)
		begin
			Q <= 1'b0;
			Qbar <= 1'b1;
		end
	else
		begin
			case ({J, K})
				2'b00:
					begin
						Q <= Q;
						Qbar <= Qbar;
					end
				2'b01:
					begin
						Q <= 1'b0;
						Qbar <= 1'b1;
					end
				2'b10:
					begin
						Q <= 1'b1;
						Qbar <= 1'b0;
					end
				2'b11:
					begin
						Q <= ~Q;
						Qbar <= ~Qbar;
					end
		endcase
	end
end

endmodule
