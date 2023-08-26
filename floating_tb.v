`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2023 12:00:55
// Design Name: 
// Module Name: float_tb
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


module float_tb();
reg [31:0]a,b;
wire [31:0]out;
floating fut (a,b,out);
initial 
begin
a=32'b10111110100110011001100110011010;b=32'b01000011111110100010000000000000;
#10
a=32'b10111110100110011001100110011010;b=32'b00000000000000000000000000000000;

end
endmodule
