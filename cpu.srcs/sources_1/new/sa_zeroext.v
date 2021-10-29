`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 吴佳宾
// 
// Create Date: 2021/10/28 21:47:28
// Design Name: 
// Module Name: sa_zeroext
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 立即数sa零扩展
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sa_zeroext(
    input   wire    [ 4:0] sa,
    output  wire    [31:0] sa_ext
);

assign sa_ext = {27'b0, sa};

endmodule
