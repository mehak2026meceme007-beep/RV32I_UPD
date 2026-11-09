`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2026 16:50:44
// Design Name: 
// Module Name: control_unit_tb
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
module control_unit_tb;

    reg [31:0] instr;

    wire reg_write;
    wire alu_src;
    wire mem_read;
    wire mem_write;
    wire mem_to_reg;
    wire branch;
    wire jump;
    wire valid;

    control_unit uut (
        .instr(instr),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .branch(branch),
        .jump(jump),
        .valid(valid)
    );

    initial begin

        // Test 1: ADD x3, x1, x2 (R-type)
        instr = 32'h002081B3;
        #10;
        $display("R-TYPE: reg_write=%b alu_src=%b valid=%b",
                 reg_write, alu_src, valid);

        // Test 2: ADDI x1, x0, 5 (I-type)
        instr = 32'h00500093;
        #10;
        $display("I-TYPE: reg_write=%b alu_src=%b valid=%b",
                 reg_write, alu_src, valid);

        // Test 3: LW x3, 8(x1)
        instr = 32'h0080A183;
        #10;
        $display("LOAD: reg_write=%b alu_src=%b mem_read=%b mem_to_reg=%b valid=%b",
                 reg_write, alu_src, mem_read, mem_to_reg, valid);

        // Test 4: SW x2, 8(x1)
        instr = 32'h0020A423;
        #10;
        $display("STORE: reg_write=%b alu_src=%b mem_write=%b valid=%b",
                 reg_write, alu_src, mem_write, valid);

        // Test 5: BEQ x1, x2, 8
        instr = 32'h00208463;
        #10;
        $display("BRANCH: branch=%b valid=%b",
                 branch, valid);

        // Test 6: JAL x1, 8
        instr = 32'h008000EF;
        #10;
        $display("JAL: reg_write=%b jump=%b valid=%b",
                 reg_write, jump, valid);

        // Test 7: JALR x1, 0(x2)
        instr = 32'h000100E7;
        #10;
        $display("JALR: reg_write=%b alu_src=%b jump=%b valid=%b",
                 reg_write, alu_src, jump, valid);

        // Test 8: Unsupported opcode
        instr = 32'hFFFFFFFF;
        #10;
        $display("INVALID: valid=%b", valid);

        $finish;

    end

endmodule
