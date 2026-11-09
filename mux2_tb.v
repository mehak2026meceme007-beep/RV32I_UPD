
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2026 21:07:05
// Design Name: 
// Module Name: mux2_tb
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

module mux2_tb;

    reg a;
    reg b;
    reg sel;
    wire y;

    integer i;
    integer errors;

    mux2 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        errors = 0;

        $display("Time | a b sel | y | Expected");
        $display("-------------------------------");

        // Test all 8 input combinations
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, sel} = i;
            #10;

            $display("%4t | %b %b  %b  | %b |    %b",
                     $time, a, b, sel, y,
                     (sel ? b : a));

            if (y !== (sel ? b : a)) begin
                errors = errors + 1;
                $display("ERROR: Output mismatch!");
            end
        end

        if (errors == 0)
            $display("PASS: All 8 tests passed.");
        else
            $display("FAIL: %0d errors detected.", errors);

        $finish;
    end

endmodule
