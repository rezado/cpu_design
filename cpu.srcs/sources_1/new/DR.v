`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/09 08:33:42
// Design Name: 
// Module Name: DR
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
module DR(
	input         CLK, //时钟
	input         en, //片选信号
	input         we, //写使能
	input  [ 5:0] addr, //读、写地址
	input  [31:0] wdata, //写数据
	output [31:0] rdata //读数据
);

reg [31:0] reg_array [31:0];
//加载数据到存储器，必须使用绝对路径
initial begin
	$readmemh("D:/Codes/Vivado/Single_CPU/Single_CPU.srcs/sources_1/new/DR.txt", reg_array);
end

//Write
always@(negedge CLK) begin
	if(en && we) reg_array[addr] <= wdata;
end
//Read
assign rdata = en ? reg_array[addr] : 32'd0;

endmodule