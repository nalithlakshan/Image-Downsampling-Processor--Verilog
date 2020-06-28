module alu1 (
	input [2:0]select,
	input [15:0]A_bus,
	input [15:0]B_bus,
	output [15:0]C_bus
);

	assign C_bus = (select==3'b000)?  A_bus
				 : (select==3'b001)?  B_bus
				 : (select==3'b010)?  0
				 : (select==3'b011)?  A_bus + 1
				 : (select==3'b100)?  A_bus + 2
				 : (select==3'b101)?  B_bus + 1
				 : (select==3'b110)?  A_bus + B_bus
				 				   :  A_bus - B_bus;


endmodule // alu