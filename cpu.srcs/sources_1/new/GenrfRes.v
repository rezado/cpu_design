`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 吴佳宾
// 
// Create Date: 2021/10/23 10:42:21
// Design Name: 
// Module Name: GenrfRes
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 多路选择器 根据控制信号选择寄存器堆写的数据
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module GenrfRes(
    input   wire [31:0] alu_result,
    input   wire [31:0] dr_rdata,
    input   wire [ 1:0] sel_rfres, // 控制信号
    output  wire [31:0] rf_wdata
);

assign rf_wdata = (sel_rfres[0] == 1'b1) ? alu_result:
                  (sel_rfres[1] == 1'b1) ? dr_rdata:
                                           32'd0;

endmodule
