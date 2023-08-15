`timescale 1ns/1ns

module LFSR(input p, clk, rs, output [7:0] Po);
	wire x, y, z, nz, t;
	Shift_Reg_8bit_sr SR1(t, clk, rs, Po);
	xor #12 xor1(x, Po[0], Po[3]),
			xor2(y, x,     Po[6]),
			xor3(z, y,     Po[7]);
	not #6  not1(nz, z);
	nand #8 nand1(t, nz, p);
endmodule

module TB ();
	reg p = 0, clk = 0, rs = 1; //First Initialize
	wire [7:0] Po;
	LFSR my_ic(p, clk, rs, Po);
	always #100 clk = ~clk;
	initial begin
		#200 rs = 0;
		#200 p  = 1;
		#10000 $stop;
	end
endmodule