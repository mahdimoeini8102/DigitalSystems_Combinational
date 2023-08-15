`timescale 1ns/1ns

module Shift_Reg_8bit(input sin, clk, output [7:0] Po);
	wire [8:0] inputs;
	assign inputs[8] = sin;
	assign Po [7:0] = inputs [7:0];
	genvar i;
	generate
		for(i=0;i<8;i=i+1)begin:dlatchs
			D_latch dlatch(.D(inputs[8-i]), .clk(clk), .Q(inputs[7-i]));
		end
	endgenerate
endmodule