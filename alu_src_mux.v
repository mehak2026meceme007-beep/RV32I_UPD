`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2026 18:52:34
// Design Name: 
// Module Name: alu_src_mux
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



module alu_src_mux (
    input  wire [31:0] reg_b,
    input  wire [31:0] imm,
    input  wire        alu_src,

    output wire [31:0] alu_b
);

    assign alu_b = alu_src ? imm : reg_b;

endmodule
