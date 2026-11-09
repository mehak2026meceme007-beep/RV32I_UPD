`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 03:20:19
// Design Name: 
// Module Name: register
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



module register (
    input  wire        clk,

    input  wire [4:0]  rs1,
    input  wire [4:0]  rs2,
    input  wire [4:0]  rd,

    input  wire [31:0] wd,
    input  wire        we,

    output wire [31:0] rd1,
    output wire [31:0] rd2
);

    // 32 registers, each 32 bits wide
    reg [31:0] registers [0:31];

    // Two asynchronous read ports
    assign rd1 = (rs1 == 5'd0) ? 32'd0 : registers[rs1];
    assign rd2 = (rs2 == 5'd0) ? 32'd0 : registers[rs2];

    // One synchronous write port
    always @(posedge clk) begin
        if (we && (rd != 5'd0))
            registers[rd] <= wd;
    end

endmodule

