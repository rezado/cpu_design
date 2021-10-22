`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/09 08:20:50
// Design Name: 
// Module Name: imm_signext
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


module imm_signext(
    input   wire[15:0]  extin,
    output  wire[31:0]  extout
);

assign extout = {{16{extin[15]}}, extin};

endmodule
