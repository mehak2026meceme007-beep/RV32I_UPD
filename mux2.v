`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2026 21:03:33
// Design Name: 
// Module Name: mux2
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



module mux2 (
    input wire a,
    input wire b,
    input wire sel,
    output reg y
);

    always @(*) begin
        case (sel)
            1'b0: y = a;
            1'b1: y = b;
            default: y = 1'b0;
        endcase
    end

endmodule
