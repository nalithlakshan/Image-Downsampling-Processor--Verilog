module flag (
	input clock,
	input [15:0]x_reg, // Input from the X register 
	input [15:0]y_reg, // Input from the Y register
	input [15:0]data_in,  // immediate data from instructions
	input wr_en,reg_select, //write enable and register select
	output x_flag,     // high if X<128
	output y_flag      // high if Y<128
);
reg [15:0] x_comp, y_comp;

always @ (negedge clock) begin 
	if (wr_en==1) begin 
		if (reg_select==1)
			y_comp<=data_in;
		else
			x_comp<=data_in;
	end
end

assign x_flag = (x_reg<x_comp)? 1:0 ; //127 for 256 image 5 for 11 image
assign y_flag = (y_reg<y_comp)? 1:0 ;

endmodule


