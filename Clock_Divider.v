module Clock_Divider(inClk, SW, outClk, reset); 
	input inClk; 
	input[9:0] SW; 
	input reset;
	output reg outClk; 
	reg[31:0] countTo; 
	reg[31:0] count; 
	
	always@(*) begin 
		casex(SW[3:0])  
			4'bXXX1: countTo = 0;
			4'b0000: countTo = 32'hBAB9;
			4'b0010: countTo = 32'hA65D; 
			4'b0100: countTo = 32'h9430; 
			4'b0110: countTo = 32'h8BE8;
			4'b1000: countTo = 32'h7CB8; 
			4'b1010: countTo = 32'h6EF9;
			4'b1100: countTo = 32'h62F1;
			4'b1110: countTo = 32'h5D5D; 
			default: countTo = 32'hAAAA; 
		endcase 
	end 
	
	always@(posedge inClk) begin 
		if (reset) begin
			count = 0;
			outClk = 0;
		end 
		else begin
			if (count <countTo) begin 
				count = count + 1; 
			end 
			else begin 
				outClk = ~outClk; 
				count = 0; 
			end 
		end
	end 

endmodule 
	
	