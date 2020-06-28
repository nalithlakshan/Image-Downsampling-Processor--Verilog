module binbcd(B,P);
	input [15:0] B;
	output [15:0] P;

	reg [15:0] P;
	reg [31:0] z;
	integer i;
  always @(B)
  begin
    for(i = 0; i <= 31; i = i+1)
	z[i] = 0;
    z[18:3] = B;

    for(i = 0; i <= 12; i = i+1)
    begin
	if(z[19:16] > 4)	
		z[19:16] = z[19:16] + 3;
	if(z[23:20] > 4) 	
		z[23:20] = z[23:20] + 3;
	if(z[27:24] > 4) 	
		z[27:24] = z[27:24] + 3;
	if(z[31:28] > 4) 	
		z[31:28] = z[31:28] + 3;
	z[31:1] = z[30:0];
    end      
    P = z[31:16];	
  end             
endmodule
