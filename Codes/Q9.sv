`timescale 1ns/1ns

module Shift_Reg_8bit_sr2(input sin, clk, rs, output reg [7:0] Po);
	always @(negedge clk) begin
		if (rs)
			Po = 8'd0;
		else
			Po = {sin, Po [7:1]};
	end
endmodule

module TB ();
	reg sin = 1, clk = 0, rs = 0; //First Initialize
	reg [7:0] Po;
	Shift_Reg_8bit_sr2 my_ic(sin, clk, rs, Po);
	always #100 clk = ~clk;
	initial begin
		#1000 sin=0;
		#1000 sin=1;
		#3000 rs =1;
		#4000 $stop;
	end
endmodule