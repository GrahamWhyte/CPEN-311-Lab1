module Clock_Divider_tb; 
	reg clk; 
	reg [31:0] countTo; 
	reg reset;
	wire outClk; 
	
	Clock_Divider dut(clk, outClk, reset, countTo); 
	
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
		reset = 1'b0; 
		countTo = 32'd5; 
		#100; 
		countTo = 32'd10; 
		#100; 
		countTo = 32'd15; 
		#100; 
		countTo = 32'd20; 
		#100; 
		$stop; 
	end 
endmodule