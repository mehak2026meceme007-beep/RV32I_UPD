`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2026 17:18:55
// Design Name: 
// Module Name: data_memory_tb
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


module data_memory_tb;

    reg clk;
    reg mem_read;
    reg mem_write;

    reg [31:0] address;
    reg [31:0] write_data;

    wire [31:0] read_data;

    data_memory uut (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        mem_read = 0;
        mem_write = 0;
        address = 0;
        write_data = 0;

        // Test 1: Write 25 to address 0x04
        address = 32'h00000004;
        write_data = 32'd25;
        mem_write = 1;

        #10;
        mem_write = 0;

        // Test 2: Read from address 0x04
        mem_read = 1;
        #2;

        $display("READ 0x04: data=%d", read_data);

        // Test 3: Write 50 to address 0x08
        mem_read = 0;
        address = 32'h00000008;
        write_data = 32'd50;
        mem_write = 1;

        #10;
        mem_write = 0;

        // Test 4: Read from address 0x08
        mem_read = 1;
        #2;

        $display("READ 0x08: data=%d", read_data);

        // Test 5: Read previous address again
        address = 32'h00000004;
        #2;

        $display("READ 0x04 AGAIN: data=%d", read_data);

        $finish;

    end

endmodule

   