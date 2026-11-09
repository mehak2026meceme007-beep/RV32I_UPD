`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2026 00:04:41
// Design Name: 
// Module Name: load_store_tb
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
module load_store_tb;

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
        instr = 32'b0;

        // Test 1: ADDI x1, x0, 8
        // x1 = 8
        instr = 32'h00800093;
        @(posedge clk);
        #1;
        $display("ADDI x1: x1=%d", dut.rf.registers[1]);

        // Test 2: ADDI x2, x0, 25
        // x2 = 25
        instr = 32'h01900113;
        @(posedge clk);
        #1;
        $display("ADDI x2: x2=%d", dut.rf.registers[2]);

        // Test 3: SW x2, 0(x1)
        // Memory[8] = 25
        instr = 32'h0020A023;
        @(posedge clk);
        #1;
        $display("SW: memory[2]=%d", dut.dmem.memory[2]);

        // Test 4: LW x3, 0(x1)
        // x3 = Memory[8]
        instr = 32'h0000A183;
        @(posedge clk);
        #1;
        $display("LW: x3=%d", dut.rf.registers[3]);

        // Final verification
        if (dut.rf.registers[3] == 32'd25)
            $display("LOAD/STORE TEST PASSED");
        else
            $display("LOAD/STORE TEST FAILED");

        $finish;
    end

endmodule
