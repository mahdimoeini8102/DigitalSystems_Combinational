`timescale 1ns/1ns

module D_latch(input D, clk, output Q, nQ);
	logic i, j, nD1, nD2, nclk, nnD;
	nand #8	Dnot(nD2, D, D),
			Dnotnot(nnD, nD1, nD1),
			clknot(nclk, clk, clk),
			nand1(i, nnD, nclk),
			nand2(j, nD2, nclk),
			nand3(Q, i, nQ),
			nand4(nQ, j, Q);
	not  #6 SRnot(nD1, D);
endmodule

module TB ();
	reg D = 1, clk = 0; //First Initialize
	wire Q, nQ;
	D_latch my_ic(D, clk, Q, nQ);
	always #20 clk = ~clk;
	initial begin
		repeat (20) #100
		#100 D = $random;
		#100 $stop;
	end
endmodule