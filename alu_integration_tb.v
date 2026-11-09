`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 03:09:10
// Design Name: 
// Module Name: alu_integration_tb
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





module alu_integration_tb;

    reg  [31:0] instr;
    reg  [31:0] a, b;

    wire [2:0]  alu_control;
    wire        valid;
    wire [31:0] result;
    wire        zero;

    // Decode the instruction
    alu_decoder decoder_inst (
        .instr(instr),
        .alu_control(alu_control),
        .valid(valid)
    );

    // Execute the selected operation
    alu alu_inst (
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    initial begin
        // Test ADD: 10 + 3 = 13
        instr = 32'h002081B3;
        a = 10;
        b = 3;
        #10;
        $display("ADD: control=%b valid=%b result=%0d zero=%b",
                 alu_control, valid, result, zero);

        // Test SUB: 10 - 3 = 7
        instr = 32'h402081B3;
        a = 10;
        b = 3;
        #10;
        $display("SUB: control=%b valid=%b result=%0d zero=%b",
                 alu_control, valid, result, zero);

        // Test AND: 12 & 10 = 8
        instr = 32'h0020F1B3;
        a = 12;
        b = 10;
        #10;
        $display("AND: control=%b valid=%b result=%0d zero=%b",
                 alu_control, valid, result, zero);

        $finish;
    end

endmodule
