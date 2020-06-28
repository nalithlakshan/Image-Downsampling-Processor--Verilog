module register_p (
	input clk,    // Clock
	input [7:0]data_in, // input from the dta memory bus
	input [3:0]reg_select, // select the loading registry 
	input write_en,  // write enable
	output [11:0]data_out // output to the B bus	
);

reg [7:0] p1,p2,p3,p4,p5,p6,p7,p8,p9;
reg[9:0] edg;

initial begin 
	p1<=0;
	p2<=0;
	p3<=0;
	p4<=0;
	p5<=0;
	p6<=0;
	p7<=0;
	p8<=0;
	p9<=0;
end

always @(negedge clk) begin
	if (write_en) begin
		case (reg_select)
			4'b0000: p1<=data_in;
			4'b0001: p2<=data_in;
			4'b0010: p3<=data_in;
			4'b0011: p4<=data_in;
			4'b0100: p5<=data_in;
			4'b0101: p6<=data_in;
			4'b0110: p7<=data_in;
			4'b0111: p8<=data_in;
			4'b1000: p9<=data_in;

		endcase
	end
end


assign data_out=(p1+{p2,1'b0}+p3+{p4,1'b0}+{p5,2'b00}+{p6,1'b0}+p7+{p8,1'b0}+p9);

// always @(*) begin
//  edg=((p1>p3)?(p1-p3):(p3-p1))+((p4>p6)?(p4-p6):(p6-p4))+((p7>p9)?(p7-p9):(p9-p7));
// end
// assign data_out={((edg>255)?255:edg[7:0]),4'b0000};


endmodule
