/*********************************************************
*	File: 				tb_Counter_4_Bit.v
*	Author: 				Sean Karl Tyrese G. Aguilar
*	Class:				CpE 3101L
*	Group/Schedule:	Group 3 - Friday, 7:30 AM to 10:30 AM
*	Description:		Testbench file for Counter_4_Bit.v
*********************************************************/

module tb_Counter_4_Bit;

reg Clk;
reg nReset;
reg Load;
reg Count_en;
reg Up;
reg [3:0] Count_in;
wire [3:0] Count_out;

Counter_4_Bit uut (
    .Clk(Clk),
    .nReset(nReset),
    .Load(Load),
    .Count_en(Count_en),
    .Up(Up),
    .Count_in(Count_in),
    .Count_out(Count_out)
);

initial begin
    Clk = 0;
    nReset = 1;
    Load = 0;
    Count_en = 0;
    Up = 0;
    Count_in = 4'b0000;

    #5 nReset = 0;
    #5 nReset = 1;

    #10 Load = 1;
    Count_in = 4'b1010;
    #10 Load = 0;

    #10 Count_en = 1;
    Up = 1;
    #50 Count_en = 0;

    #10 Count_en = 1;
    Up = 0;
    #50 Count_en = 0;

    #10 $stop;
end

always #5 Clk = ~Clk;

endmodule
