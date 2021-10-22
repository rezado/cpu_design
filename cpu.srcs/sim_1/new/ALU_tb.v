//-------testbench of ALU--------
`timescale 1ns/10ps
module ALU_tb();
reg [ 2:0]alu_op;
reg [31:0]alu_src1, alu_src2;
wire [31:0]alu_result;
ALU ALU(
	.alu_src1(alu_src1),
	.alu_src2(alu_src2),
    .alu_op(alu_op),
	.alu_result(alu_result)
);

initial
begin
	alu_op = 3'b001;
	alu_src1 = 32'd2;
	alu_src2 = 32'd1;
    #10 alu_op = 3'b010;
    #10 alu_op = 3'b100;
	#10 $stop;
end

endmodule