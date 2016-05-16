module Clock_Divider(inClk, SW, outClk, reset); 
	input inClk; 
	input[9:0] SW; 
	input reset;
	output reg outClk = 0; 
	reg[31:0] countTo; 
	reg[31:0] count; 
	
	always@(*) begin 
		case(SW[3:1])  
			//4'bXXX1: countTo = 0;
			3'b000: countTo = 32'hBAB9;
			3'b001: countTo = 32'hA65D; 
			3'b010: countTo = 32'h9430; 
			3'b011: countTo = 32'h8BE8;
			3'b100: countTo = 32'h7CB8; 
			3'b101: countTo = 32'h6EF9;
			3'b110: countTo = 32'h62F1;
			3'b111: countTo = 32'h5D5D; 
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
	
	