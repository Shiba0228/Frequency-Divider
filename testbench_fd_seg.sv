`timescale 1ns/100ps
module testbench;


	
	
	logic [7:0]w_q;
	logic reset;
	logic clk;
	integer i;
	logic enc;

	logic [6:0]		HEX0;
    logic [6:0]		HEX1;
    logic [6:0]		HEX2;
    logic [6:0]		HEX3;
    logic [6:0]		HEX4;
    logic [6:0]		HEX5;
	logic [3:0]		KEY;
	logic [9:0]		SW;
	logic [9:0]		LEDR;
	
	logic CLOCK_50;
	logic rst_n;
	logic d;

DE0_CV de0_cv1(

	//////////// CLOCK //////////
	.CLOCK_50	(CLOCK_50),
	.CLOCK2_50	(),
	.CLOCK3_50	(),
	.CLOCK4_50	(),

	//////////// SEG7 //////////
	.HEX0(),
	.HEX1(),
	.HEX2(),
	.HEX3(),
	.HEX4(),
	.HEX5(),

	//////////// KEY //////////
	.KEY		(KEY),
	.RESET_N	(rst_n),

	//////////// LED //////////
	.LEDR		(LEDR),

	
	//////////// SW //////////
	.SW			(SW)
);

	//assign KEY[0] = rst_n;

	
	
	
	
	always #10 CLOCK_50 = ~CLOCK_50;
	
	
	
	
	initial begin
		CLOCK_50 = 0; 
		rst_n = 0;
		//enc = 0;
		
		#20 rst_n = 1;

		SW[0] = 0; SW[1] = 0;
		#500000
		SW[0] = 1; SW[1] = 0;
		#500000
		SW[0] = 0; SW[1] = 1;
		#500000
		SW[0] = 1; SW[1] = 1;
		#500000 $stop;
	end
	
	
endmodule