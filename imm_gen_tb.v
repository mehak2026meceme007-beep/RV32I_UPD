`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2026 18:47:12
// Design Name: 
// Module Name: imm_gen_tb
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
module imm_gen_tb;

    reg  [31:0] instr;
    wire [31:0] imm;

    imm_gen uut (
        .instr(instr),
        .imm(imm)
    );

    initial begin

        // Test 1: ADDI x1, x0, 5
        instr = 32'h00500093;
        #10;
        $display("I-type positive: instr=%h imm=%h (%0d)",
                 instr, imm, $signed(imm));

        // Test 2: ADDI x1, x0, -1
        instr = 32'hFFF00093;
        #10;
        $display("I-type negative: instr=%h imm=%h (%0d)",
                 instr, imm, $signed(imm));

        // Test 3: SW x2, 8(x1)
        instr = 32'h0020A423;
        #10;
        $display("S-type: instr=%h imm=%h (%0d)",
                 instr, imm, $signed(imm));

        // Test 4: BEQ x1, x2, 8
        instr = 32'h00208463;
        #10;
        $display("B-type: instr=%h imm=%h (%0d)",
                 instr, imm, $signed(imm));

        // Test 5: LUI x1, 0x12345
        instr = 32'h123450B7;
        #10;
        $display("U-type: instr=%h imm=%h",
                 instr, imm);

        $finish;

    end

endmodule
