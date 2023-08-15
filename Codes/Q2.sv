module TB ();
	reg S = 1, R = 0, clk = 0; //First Initialize
	wire Q, nQ;
	SR_latch my_ic(.S(S), .R(R), .clk(clk), .Q(Q), .nQ(nQ));
	always #20 clk = ~clk;
	initial begin
		#100 R = 1;
		#100 S = 0;
		#100 S = 1;
		#100 R = 0;
		#100 S = 0;
		#300 $stop;
	end
endmodule