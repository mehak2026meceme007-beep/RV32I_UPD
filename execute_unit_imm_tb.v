`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2026 19:05:50
// Design Name: 
// Module Name: execute_unit_imm_tb
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
module execute_unit_imm_tb;

    reg clk;
    reg [31:0] instr;

    wire [31:0] operand_a;
    wire [31:0] operand_b;
    wire [31:0] result;
    wire [3:0] alu_control;
    wire valid;
    wire zero;
    wire write_enable;

    execute_unit dut (
        .clk(clk),
        .instr(instr),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(result),
        .alu_control(alu_control),
        .valid(valid),
        .zero(zero),
        .write_enable(write_enable)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        instr = 0;

        // Initialize x1 = -8 and x2 = 2
        dut.rf.registers[1] = -32'sd8;
        dut.rf.registers[2] = 32'd2;

        // SLT x3, x1, x2
        instr = 32'h0020A1B3;
        #2;
        $display("SLT: result=%d", result);

        // SLTU x3, x1, x2
        instr = 32'h0020B1B3;
        #2;
        $display("SLTU: result=%d", result);

        // SLL x3, x2, x2 (2 << 2)
        instr = 32'h002111B3;
        #2;
        $display("SLL: result=%d", result);

        // SRL x3, x2, x2 (2 >> 2)
        instr = 32'h002151B3;
        #2;
        $display("SRL: result=%d", result);

        // SRA x3, x1, x2 (-8 >> 2)
        instr = 32'h4020D1B3;
        #2;
        $display("SRA: result=%d", $signed(result));

        $finish;
    end

endmodule