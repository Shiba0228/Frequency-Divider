module frequency_divider(
	output logic clk_after,
	input clk,
	input reset_fd,
	input [1:0]sel
	);
	parameter n = 24;
	
	logic [n-1:0] count;
	
	always_ff @(posedge clk)
	begin
		if(reset_fd)
			count <= 0;
		else
			count <= count + 1;
	end
	
	//assign clk_after = count[1];
	always_comb 
	begin
		case(sel)
			0: clk_after = count[9];	//	/2^10
			1: clk_after = count[10];	//	/2^11
			2: clk_after = count[11];	//	/2^12
			3: clk_after = count[12];	//	/2^13
		default:clk_after = count[9];	
			endcase
	end
endmodule