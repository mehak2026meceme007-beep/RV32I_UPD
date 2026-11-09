`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2026 17:29:25
// Design Name: 
// Module Name: writeback_mux
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


module writeback_mux (
    input wire [31:0] alu_result,
    input wire [31:0] mem_data,
    input wire [31:0] pc_plus4,

    input wire [1:0] wb_sel,

    output reg [31:0] write_data
);

    always @(*) begin
        case (wb_sel)
            2'b00: write_data = alu_result;
            2'b01: write_data = mem_data;
            2'b10: write_data = pc_plus4;

            default: write_data = 32'b0;
        endcase
    end

endmodule
