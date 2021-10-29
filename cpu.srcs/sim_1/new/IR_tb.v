`timescale 1ns/10ps
//-------testbench of IR--------
module IR_tb();
reg inst_ram_en;
reg [31:0] IR_addr;
wire [31:0] IR_out;

IR IR(
	.inst_ram_en(inst_ram_en),
	.IR_addr(IR_addr[4:0]),
	.IR_out(IR_out)
);

initial begin
	inst_ram_en = 1;
	IR_addr = 32'd0;
	#10 IR_addr = 32'd1;
	#10 IR_addr = 32'd2;
	#10 IR_addr = 32'd3;
	#10 IR_addr = 32'd4;
	#10 IR_addr = 32'd5;
	#10 IR_addr = 32'd6;
	$stop;
end

endmodule