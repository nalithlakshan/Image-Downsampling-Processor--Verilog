module instruction_decoder(
	input  [5:0] opcode,
	input  x_flag,y_flag,//start_flag,
	output reg data_write_en,
	output reg [3:0]b_bus_select,
	output reg [7:0]c_bus_select,
	output reg [3:0]p_reg_select,
	output reg p_reg_write_en,
	output reg [2:0]alu_select,
	output reg pc_en,
	output reg stop_flag,
	output reg flag_wr_en,
	output reg flag_reg_select
	);


  parameter NOOP  =6'b000001;
  parameter LDP1  =6'b000010;
  parameter LDP2  =6'b000011;
  parameter LDP3  =6'b000100;
  parameter LDP4  =6'b000101;
  parameter CAL   =6'b000110;
  parameter STR   =6'b000111;
  parameter PP2H  =6'b001000;
  parameter H2PP  =6'b001001;
  parameter ADD   =6'b001010;
  parameter SUB   =6'b001011;
  parameter ING1  =6'b001100;
  parameter G2MAR =6'b001101;
  parameter CLH   =6'b001110;
  parameter CLX   =6'b001111;
  parameter CLY   =6'b010000;
  parameter INX   =6'b010001;
  parameter INY   =6'b010010;
  parameter JUMPX =6'b010011;
  parameter JUMPY =6'b010100;
  parameter H2MAR =6'b010101;
  parameter PP2MAR=6'b010110;
  parameter WRITE =6'b010111;
  parameter STOP  =6'b011000;
  parameter LDP5  =6'b011001;
  parameter LDP6  =6'b011010;
  parameter LDP7  =6'b011011;
  parameter LDP8  =6'b011100;
  parameter LDP9  =6'b011101;
  parameter SETX  =6'b011110;
  parameter SETY  =6'b011111;
  

 
always @(*) begin 

	//if (start_flag) begin
		case (opcode) 
			NOOP: begin 
				data_write_en  <= 1'b0;
				b_bus_select   <= 3'b000;      //connected to immediate data
				c_bus_select   <= 8'b00000000;  //no register selected
				p_reg_select   <= 4'b0000;       //p1 is selected
				p_reg_write_en <= 1'b0;        //p reg wright disable
				alu_select	   <= 3'b000;      // c_bus<=a_bus
				pc_en          <= 1'b1;         // pc incremen by 1
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			LDP1: begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000000;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b1;        //p_reg write enabled.
				alu_select	   <= 3'b000;
				pc_en          <=1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			LDP2:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000000;
				p_reg_select   <= 4'b0001;
				p_reg_write_en <= 1'b1;        //p_reg write enabled.
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0; 
			end

			LDP3:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000000;
				p_reg_select   <= 4'b0010;
				p_reg_write_en <= 1'b1;        //p_reg write enabled.
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			LDP4:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000000;
				p_reg_select   <= 4'b0011;
				p_reg_write_en <= 1'b1;        //p_reg write enabled.
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			LDP5:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000000;
				p_reg_select   <= 4'b0100;
				p_reg_write_en <= 1'b1;        //p_reg write enabled.
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			LDP6:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000000;
				p_reg_select   <= 4'b0101;
				p_reg_write_en <= 1'b1;        //p_reg write enabled.
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			LDP7:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000000;
				p_reg_select   <= 4'b0110;
				p_reg_write_en <= 1'b1;        //p_reg write enabled.
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			LDP8:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000000;
				p_reg_select   <= 4'b0111;
				p_reg_write_en <= 1'b1;        //p_reg write enabled.
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			LDP9:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000000;
				p_reg_select   <= 4'b1000;
				p_reg_write_en <= 1'b1;        //p_reg write enabled.
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			CAL:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b001;
				c_bus_select   <= 8'b00000010;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        //p_reg write desabled.
				alu_select	   <= 3'b001;      // c_bus<=b_bus
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			STR:begin
				data_write_en  <= 1'b1;        //data memory write is enabled
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000000;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;       
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			PP2H:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b100;
				c_bus_select   <= 8'b00000001;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b001;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			H2PP:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00010000;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			ADD:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000001;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b110;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			SUB:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000001;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b111;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			ING1:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b111;
				c_bus_select   <= 8'b10000000;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b101;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			G2MAR:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b111;
				c_bus_select   <= 8'b01000000;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b001;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			CLH:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000001;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b010;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			CLX:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00001000;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b010;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			CLY:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b00000100;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b010;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			INX:begin 
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b101;
				c_bus_select   <= 8'b00001000;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b101;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			INY:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b110;
				c_bus_select   <= 8'b00000100;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b101;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			JUMPX:begin
				if (x_flag) begin
					data_write_en  <= 1'b0;       
					b_bus_select   <= 3'b000;
					c_bus_select   <= 8'b00100000;
					p_reg_select   <= 4'b0000;
					p_reg_write_en <= 1'b0;        
					alu_select	   <= 3'b001;
					pc_en          <= 1'b1;
					stop_flag      <= 1'b0;
					flag_wr_en     <= 1'b0;
					flag_reg_select<= 1'b0;
				end else begin
					data_write_en  <= 1'b0;
					b_bus_select   <= 3'b000;      //connected to immediate data
					c_bus_select   <= 8'b00000000;  //no register selected
					p_reg_select   <= 4'b0000;       //p1 is selected
					p_reg_write_en <= 1'b0;        //p reg wright disable
					alu_select	   <= 3'b000;      // c_bus<=a_bus
					pc_en          <= 1'b1;         // pc incremen by 1
					stop_flag      <= 1'b0;
					flag_wr_en     <= 1'b0;
					flag_reg_select<= 1'b0;
				end
			end

			JUMPY:begin
				if (y_flag) begin
					data_write_en  <= 1'b0;       
					b_bus_select   <= 3'b000;
					c_bus_select   <= 8'b00100000;
					p_reg_select   <= 4'b0000;
					p_reg_write_en <= 1'b0;        
					alu_select	   <= 3'b001;
					pc_en          <= 1'b1;
					stop_flag      <= 1'b0;
					flag_wr_en     <= 1'b0;
					flag_reg_select<= 1'b0;
				end else begin
					data_write_en  <= 1'b0;
					b_bus_select   <= 3'b000;      //connected to immediate data
					c_bus_select   <= 8'b00000000;  //no register selected
					p_reg_select   <= 4'b0000;       //p1 is selected
					p_reg_write_en <= 1'b0;        //p reg wright disable
					alu_select	   <= 3'b000;      // c_bus<=a_bus
					pc_en          <= 1'b1;         // pc incremen by 1
					stop_flag      <= 1'b0;
					flag_wr_en     <= 1'b0;
					flag_reg_select<= 1'b0;
				end
			end

			H2MAR:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b000;
				c_bus_select   <= 8'b01000000;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b000;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			PP2MAR:begin
				data_write_en  <= 1'b0;       
				b_bus_select   <= 3'b100;
				c_bus_select   <= 8'b01000000;
				p_reg_select   <= 4'b0000;
				p_reg_write_en <= 1'b0;        
				alu_select	   <= 3'b001;
				pc_en          <= 1'b1;
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			STOP:begin
				data_write_en  <= 1'b0;
				b_bus_select   <= 3'b000;      //connected to immediate data
				c_bus_select   <= 8'b00000000;  //no register selected
				p_reg_select   <= 4'b0000;       //p1 is selected
				p_reg_write_en <= 1'b0;        //p reg wright disable
				alu_select	   <= 3'b000;      // c_bus<=a_bus
				pc_en          <= 1'b0;        // pc is desabled
				stop_flag      <= 1'b1;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end

			SETX: begin 
				data_write_en  <= 1'b0;
				b_bus_select   <= 3'b000;      //connected to immediate data
				c_bus_select   <= 8'b00000000;  //no register selected
				p_reg_select   <= 4'b0000;       //p1 is selected
				p_reg_write_en <= 1'b0;        //p reg wright disable
				alu_select	   <= 3'b000;      // c_bus<=a_bus
				pc_en          <= 1'b1;         // pc incremen by 1
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b1;
				flag_reg_select<= 1'b0;
			end

			SETY: begin 
				data_write_en  <= 1'b0;
				b_bus_select   <= 3'b000;      //connected to immediate data
				c_bus_select   <= 8'b00000000;  //no register selected
				p_reg_select   <= 4'b0000;       //p1 is selected
				p_reg_write_en <= 1'b0;        //p reg wright disable
				alu_select	   <= 3'b000;      // c_bus<=a_bus
				pc_en          <= 1'b1;         // pc incremen by 1
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b1;
				flag_reg_select<= 1'b1;
			end

			default: begin 
				data_write_en  <= 1'b0;
				b_bus_select   <= 3'b000;      //connected to immediate data
				c_bus_select   <= 8'b00000000;  //no register selected
				p_reg_select   <= 4'b0000;       //p1 is selected
				p_reg_write_en <= 1'b0;        //p reg wright disable
				alu_select	   <= 3'b000;      // c_bus<=a_bus
				pc_en          <= 1'b1;         // pc incremen by 1
				stop_flag      <= 1'b0;
				flag_wr_en     <= 1'b0;
				flag_reg_select<= 1'b0;
			end 

		endcase 
	//end 
end



endmodule // instruction_decoder