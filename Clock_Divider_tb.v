module Clock_Divider_tb; 
	reg clk; 
	reg [7:0] SW; 
	reg reset_n;
	wire outClk; 
	
	Clock_Divider dut(clk, SW, outClk, reset_n); 
	
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
		reset_n = 1'b0;
		#1000
		reset_n = 1'b1;
		SW = 8'b00000000; 
		#1000; 
		SW = 8'b00000010; 
		#1000; 
		SW = 8'b00000100; 
		#20; 
		SW = 8'b00000101;
		#20; 
		$stop; 
	end 
endmodule