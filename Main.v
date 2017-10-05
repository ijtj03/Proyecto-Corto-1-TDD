`include "VGA.v"
`include "Divisor_de_frecuencia.v"
`include "Airplane.v"
`include "Divisor_vga_Clk.v"

`timescale 1ns / 1ps
module Main(
    input gen_clk, reset,
    input [2:0]sw,
    output hsync, vsync,
    output [8:0] rgb
    );
	 wire clk_1HZ,clk_25MHZ;
	 wire [9:0] w_airplanex;
	 
	 Divisor_de_frecuencia div(.clk_in(gen_clk),.div_frec(clk_1HZ),.reset(reset));
	 Divisor_vga_Clk vgaClk(.clk_in(gen_clk),.div_frec(clk_25MHZ),.reset(reset));
	 Airplane airplane(.clk(clk_1HZ), .airplanex(w_airplanex));
	 VGA image(.clk(clk_25MHZ), .reset(reset),.sw(sw),.hsync(hsync),
					.vsync(vsync),.rgb(rgb),.airplanex(w_airplanex));


endmodule
