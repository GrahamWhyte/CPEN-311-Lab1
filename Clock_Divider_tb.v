module Clock_Divider_tb; 
	reg clk; 
	reg [9:0] SW; 
	reg reset;
	wire outClk; 
	
	Clock_Divider dut(clk, SW, outClk, reset); 
	
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
		reset = 1'b1;
		#1000
		reset = 1'b0;
		SW = 8'b00000000; 
		#1000; 
		SW = 8'b00000010; 
		#1000; 
		SW = 8'b00000100; 
		#1000; 
		SW = 8'b00000101;
		#1000; 
		$stop; 
	end 
endmodule