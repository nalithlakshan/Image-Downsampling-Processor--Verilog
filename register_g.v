module register_g (
	input clk,    // Clock
	input write_en, // Write Enable
	input [15:0]data_in, // Data input from C bus
	output reg [15:0]data_out //Data output to the B bus
);

initial begin
 data_out=0;
end

always @ (negedge clk) begin 
	if (write_en) data_out<=data_in;
end 

endmodule