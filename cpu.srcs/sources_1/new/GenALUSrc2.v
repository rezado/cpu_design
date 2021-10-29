// 多路选择器 根据控制信号产生ALU的第二个源操作数
module GenALUSrc2(
    input   wire [31:0] rf_rdata2, // 寄存器读端口2
    input   wire [31:0] imm_zero, // 零扩展的imm
    input   wire [31:0] imm_sign, // 符号扩展imm
    input   wire [31:0] sa_zero, // 零扩展sa
    input   wire [ 3:0] sel_alusrc2, //选择信号 -> 控制信号
    output  wire [31:0] alu_src2
);

assign alu_src2 = (sel_alusrc2[0] == 1'b1) ? rf_rdata2 :
                  (sel_alusrc2[1] == 1'b1) ? imm_zero :
                  (sel_alusrc2[2] == 1'b1) ? imm_sign :
                  (sel_alusrc2[3] == 1'b1) ? sa_zero :
                                             32'd0;

endmodule