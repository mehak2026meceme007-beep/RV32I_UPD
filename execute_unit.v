`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2026 14:09:02
// Design Name: 
// Module Name: execute_unit
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
module execute_unit (
    input wire clk,
    input wire [31:0] instr,

    output wire [31:0] operand_a,
    output wire [31:0] operand_b,
    output wire [31:0] result,
    output wire [3:0] alu_control,
    output wire valid,
    output wire zero,
    output wire write_enable
);

    // Instruction fields
    wire [4:0] rs1, rs2, rd;
    wire [6:0] opcode;

    assign rs1 = instr[19:15];
    assign rs2 = instr[24:20];
    assign rd = instr[11:7];
    assign opcode = instr[6:0];

    // Control signals
    wire reg_write;
    wire alu_src;
    wire mem_read;
    wire mem_write;
    wire mem_to_reg;
    wire branch;
    wire jump;
    wire control_valid;

    // Internal datapath signals
    wire [31:0] immediate;
    wire [31:0] alu_b;
    wire [31:0] memory_data;
    wire [31:0] writeback_data;

    wire alu_valid;
    wire memory_read_enable;
    wire memory_write_enable;

    wire [1:0] wb_sel;

    // 1. Main Control Unit
    control_unit ctrl (
        .instr(instr),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .branch(branch),
        .jump(jump),
        .valid(control_valid)
    );

    // 2. Register File
    register rf (
        .clk(clk),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wd(writeback_data),
        .we(write_enable),
        .rd1(operand_a),
        .rd2(operand_b)
    );

    // 3. Immediate Generator
    imm_gen imm_unit (
        .instr(instr),
        .imm(immediate)
    );

    // 4. ALU Source MUX
    alu_src_mux src_mux (
        .reg_b(operand_b),
        .imm(immediate),
        .alu_src(alu_src),
        .alu_b(alu_b)
    );

    // 5. ALU Decoder
    alu_decoder dec (
        .instr(instr),
        .alu_control(alu_control),
        .valid(alu_valid)
    );

    // 6. ALU
    alu alu_unit (
        .a(operand_a),
        .b(alu_b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    // 7. Data Memory
    assign memory_read_enable =
        mem_read && control_valid && alu_valid;

    assign memory_write_enable =
        mem_write && control_valid && alu_valid;

    data_memory dmem (
        .clk(clk),
        .mem_read(memory_read_enable),
        .mem_write(memory_write_enable),
        .address(result),
        .write_data(operand_b),
        .read_data(memory_data)
    );

    // 8. Write-Back MUX
    // 00 = ALU result
    // 01 = Data memory output
    assign wb_sel = mem_to_reg ? 2'b01 : 2'b00;

    writeback_mux wb_mux (
        .alu_result(result),
        .mem_data(memory_data),
        .pc_plus4(32'b0),
        .wb_sel(wb_sel),
        .write_data(writeback_data)
    );

    // Overall instruction validity
    assign valid = control_valid && alu_valid;

    // Register write enable
    assign write_enable =
        reg_write &&
        valid &&
        (rd != 5'd0);

endmodule
