`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2026 00:46:04
// Design Name: 
// Module Name: riscv_top
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


module riscv_top (
    input wire clk,
    input wire reset,

    output wire [31:0] pc,
    output wire [31:0] instr,
    output wire [31:0] alu_result,
    output wire valid,
    output wire write_enable,
    output wire halt
);

    // 1. Detect EBREAK
    assign halt = (instr == 32'h00100073);

    // 2. Program Counter
   PC  program_counter(
        .clk(clk),
        .reset(reset),
        .halt(halt),
        .pc(pc)
    );

    // 3. Instruction Memory
    imem instruction_memory (
        .addr(pc),
        .instr(instr)
    );

    // 4. Execute Unit
    execute_unit exec_unit (
        .clk(clk),
        .instr(instr),
        .operand_a(),
        .operand_b(),
        .result(alu_result),
        .alu_control(),
        .valid(valid),
        .zero(),
        .write_enable(write_enable)
    );

endmodule