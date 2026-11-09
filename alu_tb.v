`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 02:56:54
// Design Name: 
// Module Name: alu_tb
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
`timescale 1ns / 1ps

module alu_tb;

    reg [31:0] a, b;
    reg [3:0] alu_control;

    wire [31:0] result;
    wire zero;

    alu uut (
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    initial begin

        a = 32'd12;
        b = 32'd3;

        alu_control = 4'b0000; #10;
        $display("ADD: %d", result);

        alu_control = 4'b0001; #10;
        $display("SUB: %d", result);

        alu_control = 4'b0010; #10;
        $display("AND: %d", result);

        alu_control = 4'b0011; #10;
        $display("OR: %d", result);

        alu_control = 4'b0100; #10;
        $display("XOR: %d", result);

        // Signed comparison: 12 < 3 = false
        alu_control = 4'b0101; #10;
        $display("SLT: %d", result);

        // Unsigned comparison: 12 < 3 = false
        alu_control = 4'b0110; #10;
        $display("SLTU: %d", result);

        // Shift left: 12 << 3
        a = 32'd12;
        b = 32'd3;
        alu_control = 4'b0111; #10;
        $display("SLL: %d", result);

        // Logical right shift
        a = 32'd96;
        alu_control = 4'b1000; #10;
        $display("SRL: %d", result);

        // Arithmetic right shift: -16 >> 2
        a = -32'sd16;
        b = 32'd2;
        alu_control = 4'b1001; #10;
        $display("SRA: %d", $signed(result));

        $finish;

    end

endmodule
