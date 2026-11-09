`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2026 18:44:41
// Design Name: 
// Module Name: imm_gen
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



module imm_gen (
    input  wire [31:0] instr,
    output reg  [31:0] imm
);

    always @(*) begin

        case (instr[6:0])

            // I-type: ADDI and loads
            7'b0010011,
            7'b0000011,
            7'b1100111: begin

                imm = {
                    {20{instr[31]}},
                    instr[31:20]
                };

            end

            // S-type: Stores
            7'b0100011: begin

                imm = {
                    {20{instr[31]}},
                    instr[31:25],
                    instr[11:7]
                };

            end

            // B-type: Conditional branches
            7'b1100011: begin

                imm = {
                    {19{instr[31]}},
                    instr[31],
                    instr[7],
                    instr[30:25],
                    instr[11:8],
                    1'b0
                };

            end

            // U-type: LUI and AUIPC
            7'b0110111,
            7'b0010111: begin

                imm = {
                    instr[31:12],
                    12'b0
                };

            end

            // J-type: JAL
            7'b1101111: begin

                imm = {
                    {11{instr[31]}},
                    instr[31],
                    instr[19:12],
                    instr[20],
                    instr[30:21],
                    1'b0
                };

            end

            default: imm = 32'b0;

        endcase

    end

endmodule
