`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2026 17:31:06
// Design Name: 
// Module Name: writeback_mux_tb
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


`timescale 1ns / 1ps

module writeback_mux_tb;

    reg [31:0] alu_result;
    reg [31:0] mem_data;
    reg [31:0] pc_plus4;

    reg [1:0] wb_sel;

    wire [31:0] write_data;

    writeback_mux uut (
        .alu_result(alu_result),
        .mem_data(mem_data),
        .pc_plus4(pc_plus4),
        .wb_sel(wb_sel),
        .write_data(write_data)
    );

    initial begin

        alu_result = 32'd15;
        mem_data = 32'd100;
        pc_plus4 = 32'd104;

        // Test 1: ALU result
        wb_sel = 2'b00;
        #10;
        $display("ALU: write_data=%d", write_data);

        // Test 2: Memory data
        wb_sel = 2'b01;
        #10;
        $display("MEMORY: write_data=%d", write_data);

        // Test 3: PC + 4
        wb_sel = 2'b10;
        #10;
        $display("PC+4: write_data=%d", write_data);

        // Test 4: Invalid selection
        wb_sel = 2'b11;
        #10;
        $display("INVALID: write_data=%d", write_data);

        $finish;

    end

endmodule
