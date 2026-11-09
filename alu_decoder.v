`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 02:48:46
// Design Name: 
// Module Name: alu_decoder
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



module alu_decoder (
    input wire [31:0] instr,
    output reg [3:0] alu_control,
    output reg valid
);

    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;

    assign opcode = instr[6:0];
    assign funct3 = instr[14:12];
    assign funct7 = instr[31:25];

    always @(*) begin
        alu_control = 4'b0000;
        valid = 1'b0;

        case (opcode)

            // R-type instructions
            7'b0110011: begin
                case (funct3)

                    3'b000: begin
                        if (funct7 == 7'b0000000) begin
                            alu_control = 4'b0000; // ADD
                            valid = 1;
                        end
                        else if (funct7 == 7'b0100000) begin
                            alu_control = 4'b0001; // SUB
                            valid = 1;
                        end
                    end

                    3'b111: begin
                        if (funct7 == 7'b0000000) begin
                            alu_control = 4'b0010; // AND
                            valid = 1;
                        end
                    end

                    3'b110: begin
                        if (funct7 == 7'b0000000) begin
                            alu_control = 4'b0011; // OR
                            valid = 1;
                        end
                    end

                    3'b100: begin
                        if (funct7 == 7'b0000000) begin
                            alu_control = 4'b0100; // XOR
                            valid = 1;
                        end
                    end

                    3'b010: begin
                        if (funct7 == 7'b0000000) begin
                            alu_control = 4'b0101; // SLT
                            valid = 1;
                        end
                    end

                    3'b011: begin
                        if (funct7 == 7'b0000000) begin
                            alu_control = 4'b0110; // SLTU
                            valid = 1;
                        end
                    end

                    3'b001: begin
                        if (funct7 == 7'b0000000) begin
                            alu_control = 4'b0111; // SLL
                            valid = 1;
                        end
                    end

                    3'b101: begin
                        if (funct7 == 7'b0000000) begin
                            alu_control = 4'b1000; // SRL
                            valid = 1;
                        end
                        else if (funct7 == 7'b0100000) begin
                            alu_control = 4'b1001; // SRA
                            valid = 1;
                        end
                    end

                endcase
            end

            // I-type arithmetic
            7'b0010011: begin
                case (funct3)

                    3'b000: begin
                        alu_control = 4'b0000; // ADDI
                        valid = 1;
                    end

                    3'b010: begin
                        alu_control = 4'b0101; // SLTI
                        valid = 1;
                    end

                    3'b011: begin
                        alu_control = 4'b0110; // SLTIU
                        valid = 1;
                    end

                    3'b100: begin
                        alu_control = 4'b0100; // XORI
                        valid = 1;
                    end

                    3'b110: begin
                        alu_control = 4'b0011; // ORI
                        valid = 1;
                    end

                    3'b111: begin
                        alu_control = 4'b0010; // ANDI
                        valid = 1;
                    end

                    3'b001: begin
                        if (funct7 == 7'b0000000) begin
                            alu_control = 4'b0111; // SLLI
                            valid = 1;
                        end
                    end

                    3'b101: begin
                        if (funct7 == 7'b0000000) begin
                            alu_control = 4'b1000; // SRLI
                            valid = 1;
                        end
                        else if (funct7 == 7'b0100000) begin
                            alu_control = 4'b1001; // SRAI
                            valid = 1;
                        end
                    end

                endcase
            end

            // LW
            7'b0000011: begin
                if (funct3 == 3'b010) begin
                    alu_control = 4'b0000;
                    valid = 1;
                end
            end

            // SW
            7'b0100011: begin
                if (funct3 == 3'b010) begin
                    alu_control = 4'b0000;
                    valid = 1;
                end
            end

            default: begin
                valid = 0;
            end

        endcase
    end

endmodule