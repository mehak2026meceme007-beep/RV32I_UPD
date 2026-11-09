`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2026 16:48:32
// Design Name: 
// Module Name: control_unit
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



module control_unit (
    input wire [31:0] instr,

    output reg reg_write,
    output reg alu_src,
    output reg mem_read,
    output reg mem_write,
    output reg mem_to_reg,
    output reg branch,
    output reg jump,
    output reg valid
);

    wire [6:0] opcode;

    assign opcode = instr[6:0];

    always @(*) begin

        // Default control signals
        reg_write = 0;
        alu_src   = 0;
        mem_read  = 0;
        mem_write = 0;
        mem_to_reg = 0;
        branch    = 0;
        jump      = 0;
        valid     = 1;

        case (opcode)

            // R-type arithmetic
            7'b0110011: begin
                reg_write = 1;
            end

            // I-type arithmetic
            7'b0010011: begin
                reg_write = 1;
                alu_src   = 1;
            end

            // Load instructions
            7'b0000011: begin
                reg_write = 1;
                alu_src   = 1;
                mem_read  = 1;
                mem_to_reg = 1;
            end

            // Store instructions
            7'b0100011: begin
                alu_src   = 1;
                mem_write = 1;
            end

            // Conditional branches
            7'b1100011: begin
                branch = 1;
            end

            // JAL
            7'b1101111: begin
                reg_write = 1;
                jump      = 1;
            end

            // JALR
            7'b1100111: begin
                reg_write = 1;
                alu_src   = 1;
                jump      = 1;
            end

            // LUI
            7'b0110111: begin
                reg_write = 1;
                alu_src   = 1;
            end

            // AUIPC
            7'b0010111: begin
                reg_write = 1;
                alu_src   = 1;
            end

            // Unsupported opcode
            default: begin
                valid = 0;
            end

        endcase

    end

endmodule

