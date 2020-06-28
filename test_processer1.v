module test_processer1 (
 input clock50,
 input pc_switch,
 output clk_led,
 output [7:0]status_led,
 output [15:0]red_led,
 output [20:0]Seven_segs
);

// wires connecting modules
wire clk; // main clock used 

//data buses
wire [15:0]a_bus;
wire [15:0]b_bus;
wire [15:0]c_bus;

wire [15:0]instruction_bus;
wire [7:0] data_bus;

//input to the register read multiplexer
wire [15:0]mar_out,p_out,pc_out,pp_out,x_out,y_out,r_out,g_out;
// wires for flags
wire  x_flag,y_flag;   
// wires for control signals
wire data_write_en;
wire [2:0]b_bus_select;
wire [7:0]c_bus_select;
wire [3:0]p_reg_select;
wire p_reg_write_en;
wire [2:0]alu_select;
wire pc_en;
wire stop_flag;
wire start_flag;
wire flag_wr_en,flag_reg_select;

//wires for seven segements
wire [7:0]seg_input;


// Module Instantiation
//registers 
register_p P_REG(.clk(clk), .data_in(data_bus), .reg_select(p_reg_select), .write_en(p_reg_write_en),.data_out(p_out[11:0]));

register_g MAR(.clk(clk), .write_en(c_bus_select[6]), .data_in(c_bus), .data_out(mar_out));

register_pc PC(.clk(clk), .write_en(c_bus_select[5]), .pc_en(pc_en), .data_in(c_bus), .data_out(pc_out), .pc_switch(pc_switch));

register_g PP(.clk(clk), .write_en(c_bus_select[4]), .data_in(c_bus), .data_out(pp_out));

register_g X(.clk(clk), .write_en(c_bus_select[3]), .data_in(c_bus), .data_out(x_out));

register_g Y(.clk(clk), .write_en(c_bus_select[2]), .data_in(c_bus), .data_out(y_out));

register_g R(.clk(clk), .write_en(c_bus_select[1]), .data_in(c_bus), .data_out(r_out));

register_g H(.clk(clk), .write_en(c_bus_select[0]), .data_in(c_bus), .data_out(a_bus));

//---------------------- update 22/5------------
register_g G(.clk(clk), .write_en(c_bus_select[7]), .data_in(c_bus), .data_out(g_out));
//----------------------------------------------

//register read multiplexer 
reg_mux REG_MUX(.in1({6'b000000,instruction_bus[9:0]}),
                .in2({6'b00000000,p_out[11:4]}),
                .in3(mar_out),
                .in4(pc_out),
                .in5(pp_out),
                .in6(x_out),
                .in7(y_out),
                .in8(g_out),
                .select(b_bus_select),
                .out(b_bus) );

//flags
flag FLAGS(.x_reg(x_out), .y_reg(y_out), .x_flag(x_flag), .y_flag(y_flag),
           .clock(clk), .data_in({6'b000000,instruction_bus[9:0]}) ,.wr_en(flag_wr_en),
           .reg_select(flag_reg_select));

// ALU
alu ALU(.select(alu_select), .A_bus(a_bus), .B_bus(b_bus), .C_bus(c_bus));

//instruction memory 2 byte x 256 lines 
instruction_memory I_MEMORY(.clock(clk), .wren(1'b0), .address(pc_out), .q(instruction_bus));

//data memory 1 byte x 65536 lines 
data_memory D_MEMORY(.clock(clk), .wren(data_write_en), .address(mar_out), .q(data_bus), .data(r_out));

//instruction decoder
instruction_decoder I_DECODER(.opcode(instruction_bus[15:10]),
                              .x_flag(x_flag),
                              .y_flag(y_flag),
                            //  .start_flag(1'b1),
                              .stop_flag(stop_flag),
                              .data_write_en(data_write_en),
                              .b_bus_select(b_bus_select),
                              .c_bus_select(c_bus_select),
                              .p_reg_select(p_reg_select),
                              .p_reg_write_en(p_reg_write_en),
                              .alu_select(alu_select),
                              .pc_en(pc_en),
                              .flag_reg_select(flag_reg_select),
                              .flag_wr_en(flag_wr_en) );
									

				

//Seven segment display
seven_segments seg1(.bin(seg_input),.segments(Seven_segs));

//--------------PLL-----------------------------------------

//PLL clockGen(.inclk0(clock50),.c0(clk));

//----------------------------------------------------------

reg [31:0]count=1;
reg r_clk =0;
always @(posedge clock50)begin

  if (count==0)begin
    count<=50000000;
    r_clk<=~r_clk;
  end else
  count<=count-1;

end

//always @(posedge clock50) begin



//end  

//assign clk=clock50;
assign clk=r_clk;
assign clk_led=clk;
assign status_led=pc_out[7:0];
assign red_led = g_out;
assign seg_input=a_bus;

endmodule