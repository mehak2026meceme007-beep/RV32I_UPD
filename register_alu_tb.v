`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 03:28:31
// Design Name: 
// Module Name: register_alu_tb
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





module register_alu_tb;

    reg clk;

    // Instruction and register-file controls
    reg [31:0] instr;
    reg [4:0] rs1, rs2, rd;
    reg [31:0] wd;
    reg we;

    // Register-file outputs
    wire [31:0] a, b;

    // Decoder and ALU signals
    wire [2:0] alu_control;
    wire valid;
    wire [31:0] result;
    wire zero;

    // Register file
    register rf (
        .clk(clk),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wd(wd),
        .we(we),
        .rd1(a),
        .rd2(b)
    );

    // Instruction decoder for ALU control
    alu_decoder dec (
        .instr(instr),
        .alu_control(alu_control),
        .valid(valid)
    );

    // ALU
    alu alu_unit (
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    // 10 ns clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize inputs
        instr = 32'h002081B3; // add x3, x1, x2
        rs1 = 0;
        rs2 = 0;
        rd  = 0;
        wd  = 0;
        we  = 0;

        // Write 10 into x1
        @(negedge clk);
        rd = 1;
        wd = 32'd10;
        we = 1;

        // Write 3 into x2
        @(negedge clk);
        rd = 2;
        wd = 32'd3;

        // Stop writing and select x1 and x2
        @(negedge clk);
        we  = 0;
        rs1 = 1;
        rs2 = 2;

        #1;
        $display("A=%0d B=%0d control=%b valid=%b result=%0d zero=%b",
                 a, b, alu_control, valid, result, zero);

        // Change instruction to SUB x3, x1, x2
        instr = 32'h402081B3;
        #1;
        $display("SUB: A=%0d B=%0d control=%b result=%0d",
                 a, b, alu_control, result);

        #8;
        $finish;
    end

endmodule

