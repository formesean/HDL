module Counter(
	input wire Clk_in,
	output reg Clk_out
);

reg [27:0] count = 0;

always @(posedge Clk_in)
	begin
		if (count > 50_000_000)
			begin
				count <= 0;
			end
		else
			begin
				if (count > 25_000_000)
					Clk_out <= 0;
				else
					Clk_out <= 1;
				
				count <= count + 1;
			end
	end

endmodule
