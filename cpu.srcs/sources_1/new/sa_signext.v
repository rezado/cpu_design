`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/09 08:19:00
// Design Name: 
// Module Name: sa_signext
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


module sa_signext(
    input  [ 4:0] extin, //符号扩展输入
	output [31:0] extout //符号扩展输出
);

assign extout = {{27{extin[4]}}, extin};

endmodule
