`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/25 08:38:39
// Design Name: 
// Module Name: regfile
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
// 0 : 0
// 1 : 
initial begin
	$readmemb("D:/Codes/Vivado/Single_CPU/Single_CPU.srcs/sources_1/new/IR.txt", IR_array);
end

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
