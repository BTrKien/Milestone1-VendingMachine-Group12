module VendingMachine(
	i_clk,
	i_nickle,      // ¢5 input
	i_dime,        // ¢10 input
	i_quarter,     // ¢25 input
	o_soda,   // Output soda
	o_change,  // Change
	reset_n		//reset
);

input i_clk;
input i_nickle;	
input i_dime;		
input i_quarter;	
output reg 		  o_soda;	
output reg [2:0] o_change;
input reset_n;

reg [1:0] money;

always @(posedge i_clk or negedge reset_n) begin
	if (!reset_n) begin
		o_change <= 3'b000;
		money 	<= 2'b00;
		o_soda 	<= 1'b0;
	end else begin
		if (o_soda) begin
			o_soda 	<= 1'b0;
			money 	<= 2'b00;
			o_change <= 3'b000;
		end	
		else begin
			case (money)
				2'b00: begin
					if (i_nickle) begin
						money  <= 2'b01;
						o_soda <= 1'b0;
						o_change <= 3'b000;
					end
					else if (i_dime) begin
						money  <= 2'b10;
						o_soda <= 1'b0;
						o_change <= 3'b000;
					end	
					else if (i_quarter) begin
						money  <= 2'b00;
						o_soda <= 1'b1;
						o_change <= 3'b001; 
					end	
					else begin
						money  <= 2'b00;
						o_soda <= 1'b0;
						o_change <= 3'b000;	
					end
				end	
				2'b01: begin	
					if (i_nickle) begin
						money  <= 2'b10;
						o_soda <= 1'b0;
						o_change <= 3'b000;
					end	
					else if (i_dime) begin
						money  <= 2'b11;
						o_soda <= 1'b0;
						o_change <= 3'b000;
					end	
					else if (i_quarter) begin
						money  <= 2'b00;
						o_soda <= 1'b1;
						o_change <= 3'b010;
					end	
					else begin
						money  <= 2'b01;
						o_soda <= 1'b0;
						o_change <= 3'b000;
					end
				end	
				2'b10: begin
					if (i_nickle) begin 
						money  <= 2'b11;
						o_soda <= 1'b0;
						o_change <= 3'b000;
					end	
					else if (i_dime) begin
						money  <= 2'b00;
						o_soda <= 1'b1;
						o_change <= 3'b000;
					end	
					else if (i_quarter) begin
						money  <= 2'b00;
						o_soda <= 1'b1;
						o_change <= 3'b011;
					end	
					else begin
						money  <= 2'b10;
						o_soda <= 1'b0;
						o_change <= 3'b000;
					end
				end	
				2'b11: begin
					if (i_nickle) begin
						money  <= 2'b00;
						o_soda <= 1'b1;
						o_change <= 3'b000;
					end	
					else if (i_dime) begin
						money  <= 2'b00;
						o_soda <= 1'b1;
						o_change <= 3'b001;
					end	
					else if (i_quarter) begin
						money  <= 2'b00;
						o_soda <= 1'b1;
						o_change <= 3'b100;
					end	
					else begin
						money  <= 2'b00;
						o_soda <= 1'b0;
						o_change <= 3'b000;
					end
				end	
				default: begin	
						if (i_nickle) begin
						money  <= 2'b01;
						o_soda <= 1'b0;
						o_change <= 3'b000;
					end
					else if (i_dime) begin
						money  <= 2'b10;
						o_soda <= 1'b0;
						o_change <= 3'b000;
					end	
					else if (i_quarter) begin
						money  <= 2'b00;
						o_soda <= 1'b1;
						o_change <= 3'b001; 
					end	
					else begin
						money  <= 2'b00;
						o_soda <= 1'b0;
						o_change <= 3'b000;	
					end
				end	
			endcase
		end  
	end	
end	

endmodule