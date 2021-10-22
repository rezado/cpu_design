`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/25 11:24:07
// Design Name: 
// Module Name: top
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


module top(
    input   wire        clk, //时钟
    input   wire        rst //复位
);
wire [31:0] inst; // 指令
wire [31:0] pc, pcadd; // 当前PC 下个PC

//--------------取指--------------
// 只是顺序取指
// 指令寄存器IR
IR IR(
    .inst_ram_en (1'b1        ),
    .IR_addr     (pc          ),
    .IR_out      (inst        )
);

PC PC(
    .CLK    (clk    ),
    .reset  (rst    ),
    .PC_src (pcadd  ),
    .PC_out (pc     )
);

PCadd PCadd(
    .oldPC (pc     ),
    .newPC (pcadd  )
);

// 跳转



//--------------译码--------------
// 指令分割
wire [5:0] op; // 操作码
wire [4:0] rs, rt, rd; // 寄存器地址
wire [4:0] sa; // 偏移立即数
wire [5:0] func; // 功能码
assign op = inst[31:26];
assign rs = inst[25:21];
assign rt = inst[20:16];
assign rd = inst[15:11];
assign sa = inst[10:6];
assign func = inst[5:0];

// 控制信号生成
wire rf_we; // 寄存器写使能
wire [2:0] alu_op; // ALU操作码
controlunit controlunit(
    .op     (op     ),
    .func   (func   ),
    .rf_we  (rf_we  ),
    .alu_op (alu_op )
);


//--------------执行--------------
wire [31:0] rf_rdata1;
wire [31:0] rf_rdata2;
wire [31:0] alu_result;

regfile regfile(
    .clk    (clk       ),
    .we     (rf_we     ),
    .waddr  (rd        ),
    .raddr1 (rs        ),
    .raddr2 (rt        ),
    .wdata  (alu_result),
    .rdata1 (rf_rdata1 ),
    .rdata2 (rf_rdata2 )
);

ALU ALU(
    .alu_src1   (rf_rdata1  ),
    .alu_src2   (rf_rdata2  ),
    .alu_op     (alu_op     ),
    .alu_result (alu_result )
);



//--------------访存--------------

//--------------回写--------------

endmodule
