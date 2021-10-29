`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 吴佳宾
// 
// Create Date: 2021/09/25 08:38:39
// Design Name: 
// Module Name: regfile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 寄存器堆 里面有32个通用寄存器 存放执行过程中的结果
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module regfile(
    input   wire          clk, //时钟信号
    input   wire          we, //写使能 1'b1 1'b0
    input   wire [ 4:0]   waddr, //写地址
    input   wire [ 4:0]   raddr1, //读地址1
    input   wire [ 4:0]   raddr2, //读地址2
    input   wire [31:0]   wdata, //写数据
    output  wire [31:0]   rdata1, //读数据1
    output  wire [31:0]   rdata2 //读数据2
);
reg [31:0] reg_array[31:0]; //32个32位宽的数据
//地址:数据
// 0 : 0
// 1 : 1
// 2 : 2
// 3 : 3
initial begin
	$readmemh("D:/Codes/cpu/cpu.srcs/sources_1/new/regfile.txt", reg_array);
end

// 只有在时钟上升沿才能往里写数据
// 32项 2^5 = 32
// 0号寄存器值永远都是0
always@(posedge clk) begin
    if(we) begin
        reg_array[waddr] <= wdata;
    end else begin
        // Do nothing
    end
end
// 读端口1
assign rdata1 = (raddr1 == 5'b0) ? 32'b0 : reg_array[raddr1];
// 读端口2
assign rdata2 = (raddr2 == 5'b0) ? 32'b0 : reg_array[raddr2];

endmodule
