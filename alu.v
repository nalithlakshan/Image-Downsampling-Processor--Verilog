module alu (
	input [2:0]select,
	input [15:0]A_bus,
	input [15:0]B_bus,
	output reg [15:0]C_bus
);

always @(*) begin 
	case (select)
		3'b000:  C_bus = A_bus;
		3'b001:  C_bus = B_bus;
		3'b010:  C_bus = 0;
		3'b011:  C_bus = A_bus + 1;

		3'b100:  C_bus = A_bus + 2;
		3'b101:  C_bus = B_bus + 1;
		3'b110:  C_bus = A_bus & B_bus;
		3'b111:  C_bus = A_bus + B_bus;
	endcase
end
endmodule // alu