`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/09 09:45:17
// Design Name: 
// Module Name: controlunit
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


module controlunit(
    input   wire    [5:0] op,
    input   wire    [5:0] func,
    output  wire          rf_we, // 寄存器读使能信号
    output  wire    [2:0] alu_op // ALU控制信号
);

// 对指令的判断
wire inst_addu; // ADDU指令
// 0:不是addu     1:是addu
assign inst_addu = (op == 6'b000000) && (func == 6'b100001);

// 控制信号的生成
assign rf_we = inst_addu; // 控制信号只有一位
assign alu_op = {1'b0, 1'b0, inst_addu};

endmodule
