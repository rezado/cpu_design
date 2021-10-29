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
    output  wire    [3:0] alu_op, // ALU控制信号
    output  wire    [3:0] sel_alusrc2, // ALU源操作数2选择信号
    output  wire    [1:0] sel_rfres, // Regfile写数据选择信号
    output  wire          dr_en, //DataRam读使能
    output  wire          dr_wen //DataRam写使能
);

// 对指令的判断
wire inst_addu; // ADDU指令
wire inst_ori;
wire inst_nor;
wire inst_srl;
wire inst_lw;
wire inst_sw;
// 0:不是addu     1:是addu
assign inst_addu = (op == 6'b000000) && (func == 6'b100001);
assign inst_ori = (op == 6'b001101);
assign inst_nor = (op == 6'b000000) && (func == 6'b100111);
assign inst_srl = (op == 6'b000000) && (func == 6'b000010);
assign inst_lw = (op == 6'b100011);
assign inst_sw = (op == 6'b101011);

// 控制信号的生成
assign rf_we = inst_addu | inst_ori | inst_lw; // 控制信号只有一位
assign alu_op = {inst_srl, inst_nor, inst_ori, inst_addu | inst_lw | inst_sw};
assign sel_alusrc2 = {inst_srl, inst_lw | inst_sw, inst_ori, inst_addu};
assign sel_rfres = {inst_lw, ~inst_lw};
assign dr_en = inst_lw;
assign dr_wen = inst_sw;


endmodule
