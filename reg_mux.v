module reg_mux(
input [15:0]in1,in2,in3,in4,in5,in6,in7,in8,
output [15:0]out,
input [2:0]select
);

assign out   = (select==3'b000)?  in1
			 : (select==3'b001)?  in2
			 : (select==3'b010)?  in3
			 : (select==3'b011)?  in4
			 : (select==3'b100)?  in5
			 : (select==3'b101)?  in6
			 : (select==3'b110)?  in7
			 				   :  in8;
endmodule // reg_mux