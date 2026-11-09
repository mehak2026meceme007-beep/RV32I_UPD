
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2026 03:50:46
// Design Name: 
// Module Name: dff_tb
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

module dff_tb;

    reg clk;
    reg d;
    wire q;

    dff uut (
        .clk(clk),
        .d(d),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        d = 0;
        #12;

        d = 1;
        #10;

        d = 0;
        #10;

        $finish;
    end

endmodule

