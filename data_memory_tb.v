`timescale 1ns/1ps

module data_memory_tb;

    reg clk;
    reg mem_read;
    reg mem_write;

    reg [31:0] address;
    reg [31:0] write_data;

    wire [31:0] read_data;

    data_memory dut (

        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)

    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        mem_read = 0;
        mem_write = 0;
        address = 0;
        write_data = 0;

        // Write 1234 into address 8
        address = 32'd8;
        write_data = 32'd1234;
        mem_write = 1;

        #10;

        mem_write = 0;

        // Read address 8
        mem_read = 1;

        #1;

        if(read_data != 32'd1234)
            $display("FAIL: Memory Read");
        else
            $display("PASS: Memory Read");

        // Disabled write should not overwrite

        mem_read = 0;
        address = 32'd8;
        write_data = 32'd9999;

        #10;

        mem_read = 1;

        #1;

        if(read_data != 32'd1234)
            $display("FAIL: Disabled Write");
        else
            $display("PASS: Disabled Write");

        // Second address

        mem_read = 0;
        mem_write = 1;

        address = 32'd12;
        write_data = 32'd55;

        #10;

        mem_write = 0;
        mem_read = 1;

        #1;

        if(read_data != 32'd55)
            $display("FAIL: Address Index");
        else
            $display("PASS: Address Index");

        $display("-------------------------");
        $display("Data Memory verified");
        $display("-------------------------");

        $stop;

    end

endmodule