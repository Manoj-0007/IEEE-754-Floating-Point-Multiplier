`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2023 10:01:04
// Design Name: 
// Module Name: floating
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module floating(a,b,out);
input [31:0]a,b;
output reg[31:0]out;
reg e;
wire s,z;
wire [47:0]mul;
wire [23:0]ma,mb;
assign s=a[31]^b[31];
//assign e=a[30:23]+b[30:26]-8'd127;
//assign mul=a[22:0]*b[22:0];
//assign out[31]=s,out[30:23]=e;

assign ma={1'b1,a[22:0]}, mb={1'b1,b[22:0]};
 assign mul=ma*mb;
 assign z=mul[47];
 always @(*)
 begin
 if ((a[30:23]==8'b11111111 && a[22:0]!=23'd0) || (b[30:23]==8'b11111111 && b[22:0]!=23'd0))
 begin
 out[31]=a[31]^b[31];
 out[30:23]=8'b11111111;
  out[22:0]=23'd1;
  end
 //inf a
  else if ((a[30:23]==8'b11111111) && (a[22:0]==23'd0))
  begin
  if (b[30:0]==31'd0)
  begin
 out[31]=a[31]^b[31];
 out[30:23]=8'b11111111;
  out[22:0]=23'd1;
  end
	else
	 begin
 out[31]=a[31]^b[31];
 out[30:23]=8'b11111111;
  out[22:0]=23'd0;
  end
 end 
  //inf b
  else if (b[30:23]==8'b11111111 && b[22:0]==23'd0)
  begin
  if (a[30:0]==31'd0)
  begin
 out[31]=a[31]^b[31];
 out[30:23]=8'b11111111;
  out[22:0]=23'd1;
  end
	else
	 begin
 out[31]=a[31]^b[31];
 out[30:23]=8'b11111111;
  out[22:0]=23'd0;
  end 
  end
//zero
else if  ((a[30:0]==31'd0)||(b[30:0]==31'd0))
	 begin
 out[31]=a[31]^b[31];
 out[30:23]=8'b00000000;
  out[22:0]=23'd0;
  end 
  
  else
  begin
  if (z==0)
begin
out[31]=a[31]^b[31];
out[30:23]=a[30:23]+b[30:23]-(8'd127);
out[22:0]=mul[45:23];
end
else
begin
out[31]=a[31]^b[31];
out[30:23]=a[30:23]+b[30:23]-(8'd127)+1;
out[22:0]=mul[46:24];

end
 end
end
endmodule
