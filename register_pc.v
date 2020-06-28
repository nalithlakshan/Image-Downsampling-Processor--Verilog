module register_pc (
	input clk,    // Clock
	input write_en, // Write Enable
	input pc_en, // hold the current pc (this is for micro instructions)
	input pc_switch, //to manually pause processor
	input [15:0]data_in, // Data input from C bus
	output reg [15:0]data_out //Data output to the B bus
);

reg start;

initial begin
 data_out=0;
end

always @ (negedge clk) begin 
	if (pc_en & pc_switch) begin
		if (write_en) data_out<=data_in;
		else data_out<=data_out+1;
	end
end 

endmodule