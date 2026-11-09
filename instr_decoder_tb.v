`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 02:22:04
// Design Name: 
// Module Name: instr_decoder_tb
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

module instr_decoder_tb;

    reg  [31:0] instr;
    wire is_addi;
    wire is_add;
    wire is_sub;
    wire is_ebreak;

    instr_decoder dut (
        .instr(instr),
        .is_addi(is_addi),
        .is_add(is_add),
        .is_sub(is_sub),
        .is_ebreak(is_ebreak)
    );

    initial begin
        // Test 1: addi x1, x0, 5
        instr = 32'h00500093;
        #10;
        $display("instr=%h | addi=%b add=%b sub=%b ebreak=%b",
                 instr, is_addi, is_add,is_sub, is_ebreak);
         

        // Test 2: addi x2, x0, 10
        instr = 32'h00A00113;
        #10;
       $display("instr=%h | addi=%b add=%b sub=%b ebreak=%b",
                 instr, is_addi, is_add,is_sub, is_ebreak);
         

        // Test 3: add x3, x1, x2
        instr = 32'h002081B3;
        #10;
       $display("instr=%h | addi=%b add=%b sub=%b ebreak=%b",
                 instr, is_addi, is_add,is_sub, is_ebreak);
         
        
        // Test 4: sub x3, x1, x2
        instr = 32'h402081B3;
        #10;
        $display("instr=%h | addi=%b add=%b sub=%b ebreak=%b",
                 instr, is_addi, is_add,is_sub, is_ebreak);
         

        // Test 5: ebreak
        instr = 32'h00100073;
        #10;
        $display("instr=%h | addi=%b add=%b ebreak=%b",
                 instr, is_addi, is_add, is_ebreak);

        $finish;
    end

endmodule

