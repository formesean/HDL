/*********************************************************
*	File: 				Counter_4_Bit.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Counter_4_Bit.v Module
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

module Counter_4_Bit(
	input wire Clk, nReset, Load, Count_en, Up,
	input wire [3:0] Count_in,
	output reg [3:0] Count_out
);
always @(negedge Clk or negedge nReset)
begin
	if (!nReset)
		Count_out <= 4'b0000; 
	else if (Load)
		Count_out <= Count_in; 
	else if (Count_en) 
		begin
			if (Up)
				Count_out <= Count_out + 1;
			else
				Count_out <= Count_out - 1; 
		end
end
endmodule 

module top(
    input wire clk_50MHz,  
    input wire reset,      
    input wire Load, Count_en, Up,  
    input wire [3:0] Count_in,      
    output wire [3:0] Count_out     
);

    wire clk_1Hz;  

    clock_divider clk_div(
        .clk_50MHz(clk_50MHz),
        .clk_1Hz(clk_1Hz)
    );

    Counter_4_Bit counter_4_Bit(
        .Clk(clk_1Hz),        
        .nReset(reset),       
        .Load(Load),          
        .Count_en(Count_en),  
        .Up(Up),              
        .Count_in(Count_in),  
        .Count_out(Count_out) 
    );

endmodule
