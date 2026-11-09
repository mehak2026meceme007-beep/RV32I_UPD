`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2026 17:17:05
// Design Name: 
// Module Name: data_memory
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


module data_memory (
    input wire clk,
    input wire mem_read,
    input wire mem_write,

    input wire [31:0] address,
    input wire [31:0] write_data,

    output wire [31:0] read_data
);

    // 64 words, each 32 bits
    reg [31:0] memory [0:63];

    integer i;

    // Initialize memory to zero
    initial begin
        for (i = 0; i < 64; i = i + 1)
            memory[i] = 32'b0;
    end

    // Synchronous write
    always @(posedge clk) begin
        if (mem_write)
            memory[address[7:2]] <= write_data;
    end

    // Asynchronous read
    assign read_data = mem_read ?
                       memory[address[7:2]] : 32'b0;

endmodule
