`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 22:31:44
// Design Name: 
// Module Name: top_tb
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


module top_tb();
reg clk, rst;
top top(
    .clk (clk ),
    .rst (rst )
);

initial begin
	clk = 0;
	rst = 1;
	#1 rst = 0;
end

always #10 clk = ~clk;

endmodule
