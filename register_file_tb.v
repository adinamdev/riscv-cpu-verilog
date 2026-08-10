`timescale 1ns/1ps

module register_file_tb;

    reg         clk;
    reg         reg_write;
    reg  [4:0]  rs1;
    reg  [4:0]  rs2;
    reg  [4:0]  rd;
    reg  [31:0] write_data;

    wire [31:0] read_data1;
    wire [31:0] read_data2;

    register_file dut (
        .clk        (clk),
        .reg_write  (reg_write),
        .rs1        (rs1),
        .rs2        (rs2),
        .rd         (rd),
        .write_data (write_data),
        .read_data1 (read_data1),
        .read_data2 (read_data2)
    );

    // 10 ns clock period
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Safe initial values
        reg_write  = 1'b0;
        rs1        = 5'd0;
        rs2        = 5'd0;
        rd         = 5'd0;
        write_data = 32'd0;

        // Test 1: write 25 into x5
        #2;
        rd         = 5'd5;
        write_data = 32'd25;
        reg_write  = 1'b1;

        #10;
        reg_write = 1'b0;

        rs1 = 5'd5;
        #1;

        if (read_data1 !== 32'd25)
            $display("FAIL: x5 expected 25, received %0d", read_data1);
        else
            $display("PASS: x5 correctly stores 25");

        // Test 2: write 100 into x10
        rd         = 5'd10;
        write_data = 32'd100;
        reg_write  = 1'b1;

        #10;
        reg_write = 1'b0;

        // Read x5 and x10 simultaneously
        rs1 = 5'd5;
        rs2 = 5'd10;
        #1;

        if ((read_data1 !== 32'd25) ||
            (read_data2 !== 32'd100))
            $display("FAIL: simultaneous read incorrect");
        else
            $display("PASS: simultaneous reads work");

        // Test 3: reg_write = 0 should block write
        rd         = 5'd5;
        write_data = 32'd77;
        reg_write  = 1'b0;

        #10;
        rs1 = 5'd5;
        #1;

        if (read_data1 !== 32'd25)
            $display("FAIL: x5 changed while reg_write was 0");
        else
            $display("PASS: reg_write correctly blocks writes");

        // Test 4: writing to x0 must be ignored
        rd         = 5'd0;
        write_data = 32'd999;
        reg_write  = 1'b1;

        #10;
        reg_write = 1'b0;

        rs1 = 5'd0;
        #1;

        if (read_data1 !== 32'd0)
            $display("FAIL: x0 changed from zero");
        else
            $display("PASS: x0 remains hardwired to zero");

        $display("Register File verification complete.");
        $stop;
    end

endmodule