`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 02:19:46
// Design Name: 
// Module Name: instr_decoder
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



module instr_decoder (
    input wire [31:0] instr,

    output wire is_addi,
    output wire is_add,
    output wire is_sub,
    output wire is_ebreak
);

    // Recognize ADDI
    assign is_addi =
        (instr[6:0] == 7'b0010011) &&
        (instr[14:12] == 3'b000);

    // Recognize ADD
    assign is_add =
        (instr[6:0] == 7'b0110011) &&
        (instr[14:12] == 3'b000) &&
        (instr[31:25] == 7'b0000000);
          
      // Recognize SUB
    assign is_sub =
        (instr[6:0] == 7'b0110011) &&
        (instr[14:12] == 3'b000) &&
        (instr[31:25] == 7'b0100000);
        

    // Recognize the exact EBREAK encoding
    assign is_ebreak = (instr == 32'h00100073);

endmodule

