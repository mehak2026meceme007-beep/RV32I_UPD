`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 02:50:35
// Design Name: 
// Module Name: alu_decoder_tb
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
module alu_decoder_tb;

    reg [31:0] instr;
    wire [3:0] alu_control;
    wire valid;

    alu_decoder uut (
        .instr(instr),
        .alu_control(alu_control),
        .valid(valid)
    );

    initial begin

        // R-type instructions

        instr = 32'h002081B3; #10;
        $display("ADD: control=%b valid=%b", alu_control, valid);

        instr = 32'h402081B3; #10;
        $display("SUB: control=%b valid=%b", alu_control, valid);

        instr = 32'h0020F1B3; #10;
        $display("AND: control=%b valid=%b", alu_control, valid);

        instr = 32'h0020E1B3; #10;
        $display("OR: control=%b valid=%b", alu_control, valid);

        instr = 32'h0020C1B3; #10;
        $display("XOR: control=%b valid=%b", alu_control, valid);

        instr = 32'h0020A1B3; #10;
        $display("SLT: control=%b valid=%b", alu_control, valid);

        instr = 32'h0020B1B3; #10;
        $display("SLTU: control=%b valid=%b", alu_control, valid);

        instr = 32'h002091B3; #10;
        $display("SLL: control=%b valid=%b", alu_control, valid);

        instr = 32'h0020D1B3; #10;
        $display("SRL: control=%b valid=%b", alu_control, valid);

        instr = 32'h4020D1B3; #10;
        $display("SRA: control=%b valid=%b", alu_control, valid);

        // I-type instructions

        instr = 32'h00500093; #10;
        $display("ADDI: control=%b valid=%b", alu_control, valid);

        instr = 32'h0050A193; #10;
        $display("SLTI: control=%b valid=%b", alu_control, valid);

        instr = 32'h0050B193; #10;
        $display("SLTIU: control=%b valid=%b", alu_control, valid);

        instr = 32'h0050C193; #10;
        $display("XORI: control=%b valid=%b", alu_control, valid);

        instr = 32'h0050E193; #10;
        $display("ORI: control=%b valid=%b", alu_control, valid);

        instr = 32'h0050F193; #10;
        $display("ANDI: control=%b valid=%b", alu_control, valid);

        instr = 32'h00509193; #10;
        $display("SLLI: control=%b valid=%b", alu_control, valid);

        instr = 32'h0050D193; #10;
        $display("SRLI: control=%b valid=%b", alu_control, valid);

        instr = 32'h4050D193; #10;
        $display("SRAI: control=%b valid=%b", alu_control, valid);

        // Memory instructions

        instr = 32'h0080A183; #10;
        $display("LW: control=%b valid=%b", alu_control, valid);

        instr = 32'h0020A423; #10;
        $display("SW: control=%b valid=%b", alu_control, valid);

        // Unsupported instruction
        instr = 32'hFFFFFFFF; #10;
        $display("INVALID: control=%b valid=%b", alu_control, valid);

        $finish;

    end

endmodule