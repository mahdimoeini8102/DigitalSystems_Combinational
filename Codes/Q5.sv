module TB ();
	reg sin = 1, clk = 0; //First Initialize
	wire [7:0] Po;
	Shift_Reg_8bit my_ic(sin, clk, Po);
	always #500 clk = ~clk;
	initial begin
		#1000 sin=0;
		#1000 sin=1;
		#1000 $stop;
	end
endmodule