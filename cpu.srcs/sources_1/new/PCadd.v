//2021-7-18,吴佳宾
//加法器
`timescale 1ns/10ps
module PCadd(
	input     wire      [31:0]   oldPC, //当前指令地址
	output    wire      [31:0]   newPC //下一条指令地址
);

assign newPC = oldPC + 1;

endmodule