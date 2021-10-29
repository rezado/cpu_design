`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 吴佳宾
// 
// Create Date: 2021/10/09 08:18:45
// Design Name: 
// Module Name: imm_zeroext
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 对立即数imm进行零扩展
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module imm_zeroext(
    input   wire[15:0]  extin,
    output  wire[31:0]  extout
);

assign extout = {16'b0, extin};

endmodule
