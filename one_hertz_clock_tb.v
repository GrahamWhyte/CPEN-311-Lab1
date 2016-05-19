module clock_tb;
	reg clk;
	wire [7:0] LED;
	
	one_hertz_clock clockDUT(clk, LED);

	initial begin
		clk = 0; 
		
		forever begin
			clk = 0; 
			#1; 
			clk = 1; 
			#1; 
		end 
	end 
	
	initial begin
	
	#1000;
	$stop;
	
	end
	
endmodule	


