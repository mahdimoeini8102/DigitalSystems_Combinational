`timescale 1ns/1ns

module SR_latch(input S, R, clk, output Q, nQ);
	wire i, j, nS, nR;
	nand #8 not_clk(nclk,clk,clk),
			not_S(nS,S,S),
			not_R(nR,R,R),
			nand1(i,nS,nclk),
			nand2(j,nR,nclk),
			nand3(Q,i,nQ),
			nand4(nQ,j,Q);
endmodule