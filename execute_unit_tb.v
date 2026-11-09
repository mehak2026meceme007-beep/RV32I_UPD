`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2026 14:09:59
// Design Name: 
// Module Name: execute_unit_tb
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
module execute_unit_tb;

    reg clk;
    reg [31:0] instr;

    wire [31:0] operand_a;
    wire [31:0] operand_b;
    wire [31:0] result;

    wire [2:0] alu_control;
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

    // Generate clock: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        // Simulation-only preload of register values
        dut.rf.registers[1] = 32'd10;
        dut.rf.registers[2] = 32'd3;

        // Test 1: ADD x3, x1, x2
        instr = 32'h002081B3;

        #6;

        $display("ADD: A=%0d B=%0d Result=%0d",
                 operand_a, operand_b, result);

        // Test 2: Read back x3 using ADD x4, x3, x0
        instr = 32'h00018233;

        #1;

        $display("READ x3: A=%0d B=%0d",
                 operand_a, operand_b);

        // Test 3: SUB x5, x1, x2
        @(negedge clk);
        instr = 32'h402082B3;

        #1;

        $display("SUB: A=%0d B=%0d Result=%0d",
                 operand_a, operand_b, result);

        // Wait for SUB write-back
        @(posedge clk);
        #1;

        // Read back x5 using ADD x6, x5, x0
        instr = 32'h00028333;

        #1;

        $display("READ x5: A=%0d B=%0d",
                 operand_a, operand_b);

        $finish;
    end

endmodule

