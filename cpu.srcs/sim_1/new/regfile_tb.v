`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/25 09:00:32
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb();
// 变量定义
// 模块输入：reg
// 模块输出：wire
reg          clk; //时钟信号
reg          we; //写使能 1'b1 1'b0
reg [ 4:0]   waddr; //写地址
reg [ 4:0]   raddr1; //读地址1
reg [ 4:0]   raddr2; //读地址2
reg [31:0]   wdata; //写数据
wire [31:0]   rdata1; //读数据1
wire [31:0]   rdata2; //读数据2

// 元件例化 调用
regfile regfile(
    .clk    (clk    ),
    .we     (we     ),
    .waddr  (waddr  ),
    .raddr1 (raddr1 ),
    .raddr2 (raddr2 ),
    .wdata  (wdata  ),
    .rdata1 (rdata1 ),
    .rdata2 (rdata2 )
);

// 写测试
// 读测试
// 初始化
initial begin
    clk = 1'b0;
    we = 1'b1;
    waddr = 5'd1;
    raddr1 = 5'd1;
    raddr2 = 5'b0;
    wdata = 32'd1;
    #30 $stop;
end

// 时钟信号的生成
always #10 clk = ~clk;

endmodule
