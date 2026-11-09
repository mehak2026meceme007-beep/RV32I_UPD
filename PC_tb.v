`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2026 04:00:57
// Design Name: 
// Module Name: PC_tb
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

module PC_tb;

    reg clk;
    reg reset;
    wire [31:0] pc;

    PC uut (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #12;
        reset = 0;
        #40;
        $finish;
    end

endmodule
