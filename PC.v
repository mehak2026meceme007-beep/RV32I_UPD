`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2026 03:55:17
// Design Name: 
// Module Name: PC
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


module PC(
    input wire clk,
    input wire reset,
    input wire halt,
    output reg [31:0] pc
);

    always @(posedge clk) begin
        if (reset)
            pc <= 32'd0;
        else if (!halt)
            pc <= pc + 32'd4;
    end

endmodule