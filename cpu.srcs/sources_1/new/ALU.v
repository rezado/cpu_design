`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/25 09:49:14
// Design Name: 
// Module Name: ALU
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


module ALU(
    input   wire [31:0] alu_src1, //ALU源操作数1
    input   wire [31:0] alu_src2, //ALU源操作数2
    input   wire [ 3:0] alu_op, //ALU控制信号 0-1独热码
    output  wire [31:0] alu_result //ALU结果
);
/*
ALU 
加法 add      lw sw      alu_op[0] 1 0
各组自己的：
nor 或非                 alu_op[1]
srl 逻辑右移             alu_op[2]
*/
// 控制信号的解码
wire op_add; //加法
wire op_or; //或
wire op_nor; //或非
wire op_srl; //逻辑右移
assign op_add = alu_op[0];
assign op_or  = alu_op[1];
assign op_nor = alu_op[2];
assign op_srl = alu_op[3];

// 运算操作
wire [31:0] add_result;
wire [31:0] or_result;
wire [31:0] nor_result;
wire [31:0] srl_result;
assign add_result = alu_src1 + alu_src2;
assign or_result = alu_src1 | alu_src2;
assign nor_result = ~(or_result);
assign srl_result = alu_src1 >> alu_src2;

// 结果选择
assign alu_result = ({32{op_add}} & add_result)
                  | ({32{op_or }} & or_result )
                  | ({32{op_nor}} & nor_result)
                  | ({32{op_srl}} & srl_result);

endmodule