`timescale 1ns/1ns

module MSDFF(input D, clk, output Q, nQ);
	wire mid, nclk;
	not #6 notclk(nclk, clk);
	D_latch first_part(.D(D), .clk(clk), .Q(mid));
	D_latch second_part(.D(mid), .clk(nclk), .Q(Q), .nQ(nQ));
endmodule