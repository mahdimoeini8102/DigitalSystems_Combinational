`timescale 1ns/1ns

module Shift_Reg_8bit_sr(input sin, clk, rs, output [7:0] Po);
	wire [8:0] inputs;
	assign inputs[8] = sin;
	assign Po [7:0] = inputs [7:0];
	genvar i;
	generate
		for(i=0;i<8;i=i+1)begin:MSDFFSRs
			MSDFFSR MSDFFSRi(.D(inputs[8-i]), .clk(clk), .rs(rs), .Q(inputs[7-i]));
		end
	endgenerate
endmodule

module TB ();
	reg sin = 1, clk = 0, rs = 0; //First Initialize
	wire [7:0] Po;
	Shift_Reg_8bit_sr my_ic(sin, clk, rs, Po);
	always #100 clk = ~clk;
	initial begin
		#1000 sin=0;
		#1000 sin=1;
		#3000 rs =1;
		#4000 $stop;
	end
endmodule