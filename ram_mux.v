module ram_mux (
	input select,
	input [7:0]data_in_uart,data_in_processer,
	input [15:0]address_uart,address_processer,
	input wr_en_uart,wr_en_processer,
	output [7:0] data_in_ram,
	output [15:0] address_ram,
	output wr_en_ram
);

	assign data_in_ram = (select==1'b0)? data_in_uart : data_in_processer ;

	assign address_ram = (select==1'b0)? address_uart : address_processer ;

	assign wr_en_ram   = (select==1'b0)? wr_en_uart   : wr_en_processer ;

endmodule 