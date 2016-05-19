module one_hertz_clock(one_hertz_clock, LEDR);
	input one_hertz_clock;
	output reg[7:0] LEDR = 8'b00000001;
	reg flag = 0; 
	
/*	wire[7:0] current_state;
	reg [7:0] next_state = 8'b10000000;

	vDFF #(8) counter(one_hertz_clock, next_state, current_state);
*/	
	
	always @(posedge one_hertz_clock) begin
		//case(current_state)
		if (flag) begin  
			LEDR = LEDR >> 1; 
			if (LEDR == 8'b00000001) 
				flag = ~flag;
		end 
		else begin 
			LEDR = LEDR << 1; 
			if (LEDR == 8'b10000000) 
				flag = ~flag;
		end 	
	end
		/*8'b00000001: {next_state, LEDR} = {8'b00000010, current_state};
		8'b00000010: {next_state, LEDR} = {8'b00000100, current_state};
		8'b00000100: {next_state, LEDR} = {8'b00001000, current_state};
		8'b00001000: {next_state, LEDR} = {8'b00010000, current_state};
		8'b00010000: {next_state, LEDR} = {8'b00100000, current_state};
		8'b00100000: {next_state, LEDR} = {8'b01000000, current_state};
		8'b01000000: {next_state, LEDR} = {8'b10000000, current_state};
		8'b10000000: {next_state, LEDR} = {8'b00000001, current_state};
		//default: {next_state, LEDR} = {8'b00000000, current_state};
		endcase
	end
*/	
endmodule

/*
module vDFF(clk, in, out);
  parameter n = 5;
  input clk;
  input [n-1:0] in;
  output [n-1:0] out;
  reg [n-1:0] out;
  always @(posedge clk)
    out = in;

endmodule
*/