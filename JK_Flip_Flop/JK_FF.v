/*********************************************************
*	File: 				JK_FF.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		JK_FF.v Module
*********************************************************/
module clock_divider(
    input wire clk_50MHz,    
    input wire reset,       
    output reg clk_1Hz      
);

reg [25:0] counter; 

always @(posedge clk_50MHz or posedge reset) 
begin
    if (reset) 
    begin
        counter <= 0;
        clk_1Hz <= 0;
    end else 
    begin
        counter <= counter + 1;
        
        if (counter == 25_000_000) 
        begin
            clk_1Hz <= ~clk_1Hz; 
            counter <= 0;         
        end
    end
end

endmodule

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

module top(
    input wire clk_50MHz,   
    input wire J, K, nReset,
	 output wire Q, Qbar
);

    wire clk_1Hz;  

    clock_divider clk_div(
        .clk_50MHz(clk_50MHz),
        .clk_1Hz(clk_1Hz)
    );

    JK_FF jk_ff(
			.J(J),
			.K(K),
			.nReset(nReset),
			.Clk(clk_1Hz),
			.Q(Q),
			.Qbar(Qbar)
    );

endmodule
