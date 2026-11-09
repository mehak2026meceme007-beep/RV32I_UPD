`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 03:24:25
// Design Name: 
// Module Name: register_tb
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



module register_tb;

    reg clk;
    reg [4:0] rs1, rs2, rd;
    reg [31:0] wd;
    reg we;

    wire [31:0] rd1, rd2;

    register uut (
        .clk(clk),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wd(wd),
        .we(we),
        .rd1(rd1),
        .rd2(rd2)
    );

    // 10 ns clock period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize inputs
        rs1 = 0;
        rs2 = 0;
        rd  = 0;
        wd  = 0;
        we  = 0;

        // Test 1: Write 25 into x5
        @(negedge clk);
        rd = 5;
        wd = 32'd25;
        we = 1;

        @(posedge clk);
        #1;
        $display("TEST 1: Write x5=25");

        // Test 2: Read x5 through both ports
        @(negedge clk);
        we  = 0;
        rs1 = 5;
        rs2 = 5;

        #1;
        $display("TEST 2: rd1=%0d rd2=%0d", rd1, rd2);

        // Test 3: Write 10 into x6
        @(negedge clk);
        rd = 6;
        wd = 32'd10;
        we = 1;

        @(posedge clk);
        #1;

        // Read x5 and x6 simultaneously
        @(negedge clk);
        we  = 0;
        rs1 = 5;
        rs2 = 6;

        #1;
        $display("TEST 3: x5=%0d x6=%0d", rd1, rd2);

        // Test 4: Attempt to write 99 into x0
        @(negedge clk);
        rd = 0;
        wd = 32'd99;
        we = 1;

        @(posedge clk);
        #1;

        // Read x0 through both ports
        @(negedge clk);
        we  = 0;
        rs1 = 0;
        rs2 = 0;

        #1;
        $display("TEST 4: x0 read1=%0d read2=%0d", rd1, rd2);

        $finish;
    end

endmodule

