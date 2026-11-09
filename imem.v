`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2026 02:45:23
// Design Name: 
// Module Name: imem
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






module imem (
    input  wire [31:0] addr,
    output wire [31:0] instr
);

    reg [31:0] rom [0:15];

    initial begin
        rom[0] = 32'h00500093; // addi x1, x0, 5
        rom[1] = 32'h00A00113; // addi x2, x0, 10
        rom[2] = 32'h002081B3; // add  x3, x1, x2
        rom[3] = 32'h402081B3; // sub  x3, x1, x2
        rom[4] = 32'h00100073; // ebreak
    end

    assign instr = rom[addr[5:2]];

endmodule

