`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 01:51:51
// Design Name: 
// Module Name: imem_tb
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




module imem_tb;

    reg  [31:0] addr;
    wire [31:0] instr;

    imem uut (
        .addr(addr),
        .instr(instr)
    );

    initial begin
        addr = 32'h00000000;
        #10;
        $display("PC=%h Instruction=%h", addr, instr);

        addr = 32'h00000004;
        #10;
        $display("PC=%h Instruction=%h", addr, instr);

        addr = 32'h00000008;
        #10;
        $display("PC=%h Instruction=%h", addr, instr);

        addr = 32'h0000000C;
        #10;
        $display("PC=%h Instruction=%h", addr, instr);

        $finish;
    end

endmodule
