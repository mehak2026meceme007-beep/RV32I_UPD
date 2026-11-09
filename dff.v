`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2026 03:42:34
// Design Name: 
// Module Name: dff
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


module dff(
input wire d,
input wire clk,
output reg q
    );
    always @(posedge clk) begin
    q<=d;
    end
    
endmodule
