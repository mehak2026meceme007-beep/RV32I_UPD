`timescale 1ns /1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 02:54:51
// Design Name: 
// Module Name: alu
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



module alu (
    input wire [31:0] a,
    input wire [31:0] b,
    input wire [3:0] alu_control,
    output reg [31:0] result,
    output wire zero
);

    always @(*) begin
        case (alu_control)

            4'b0000: result = a + b;                 // ADD
            4'b0001: result = a - b;                 // SUB
            4'b0010: result = a & b;                 // AND
            4'b0011: result = a | b;                 // OR
            4'b0100: result = a ^ b;                 // XOR
            4'b0101: result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0; // SLT
            4'b0110: result = (a < b) ? 32'd1 : 32'd0;                  // SLTU
            4'b0111: result = a << b[4:0];           // SLL
            4'b1000: result = a >> b[4:0];           // SRL
            4'b1001: result = $signed(a) >>> b[4:0]; // SRA

            default: result = 32'b0;

        endcase
    end

    assign zero = (result == 32'b0);

endmodule
