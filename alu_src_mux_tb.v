`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2026 18:53:28
// Design Name: 
// Module Name: alu_src_mux_tb
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

module alu_src_mux_tb;

    reg  [31:0] reg_b;
    reg  [31:0] imm;
    reg         alu_src;

    wire [31:0] alu_b;

    alu_src_mux uut (
        .reg_b(reg_b),
        .imm(imm),
        .alu_src(alu_src),
        .alu_b(alu_b)
    );

    initial begin

        // Test 1: Select register operand
        reg_b = 32'd10;
        imm = 32'd5;
        alu_src = 0;

        #10;
        $display("Register selected: alu_b=%0d", alu_b);

        // Test 2: Select immediate operand
        alu_src = 1;

        #10;
        $display("Immediate selected: alu_b=%0d", alu_b);

        // Test 3: Negative immediate
        imm = -32'sd1;

        #10;
        $display("Negative immediate: alu_b=%0d",
                 $signed(alu_b));

        $finish;

    end

endmodule

