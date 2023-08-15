`timescale 1ns/1ns

module MSDFFSR(input D, clk, rs, output Q, nQ);
	wire mid, i, ni, nrs, nclk;
	not #6  notclk(nclk, clk),
			noti(ni, i),
			notR(nrs, rs);
	nand #8 nand1(i, D, nrs);
	D_latch first_part(.D(ni), .clk(clk), .Q(mid));
	D_latch second_part(.D(mid), .clk(nclk), .Q(Q), .nQ(nQ));
endmodule

module TB ();
	reg D = 1, rs = 0, clk = 0; //First Initialize
	wire Q, nQ;
	MSDFFSR my_ic(D, clk, rs, Q, nQ);
	always #50 clk = ~clk;
	initial begin
		#200 rs = 1;
		#200  D = 0;
		#200 rs = 0;
		#200  D = 1;
		#200 rs = 1;
		#200 $stop;
	end
endmodule