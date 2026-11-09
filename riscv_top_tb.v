`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2026 00:49:06
// Design Name: 
// Module Name: riscv_top_tb
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
module riscv_top_tb;

    reg clk;
    reg reset;

    wire [31:0] pc;
    wire [31:0] instr;
    wire [31:0] alu_result;

    wire valid;
    wire write_enable;
    wire halt;

    riscv_top dut (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instr(instr),
        .alu_result(alu_result),
        .valid(valid),
        .write_enable(write_enable),
        .halt(halt)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        #12;
        reset = 0;

        // Wait until EBREAK is detected
        wait(halt == 1'b1);
        #1;

        $display("--------------------------------");
        $display("PROCESSOR HALTED");
        $display("PC = %h", pc);
        $display("Instruction = %h", instr);

        $display("x1 = %d", dut.exec_unit.rf.registers[1]);
        $display("x2 = %d", dut.exec_unit.rf.registers[2]);
        $display("x3 = %d",
         $signed(dut.exec_unit.rf.registers[3]));

        if (dut.exec_unit.rf.registers[3] == 32'hFFFFFFFB)
            $display("PROCESSOR TEST PASSED");
        else
            $display("PROCESSOR TEST FAILED");

        $finish;
    end

endmodule