`timescale 1ns/1ps

module immediate_generator_tb;

    reg  [31:0] instruction;
    wire [31:0] immediate;

    immediate_generator dut (
        .instruction(instruction),
        .immediate(immediate)
    );

    initial begin

        // I-Type positive immediate: +10
        instruction = 32'd0;
        instruction[6:0]   = 7'b0010011;
        instruction[31:20] = 12'd10;
        #1;

        if (immediate !== 32'd10)
            $display("FAIL: I-Type positive");
        else
            $display("PASS: I-Type positive");

        // I-Type negative immediate: -4
        instruction = 32'd0;
        instruction[6:0]   = 7'b0010011;
        instruction[31:20] = 12'hFFC;
        #1;

        if (immediate !== 32'hFFFFFFFC)
            $display("FAIL: I-Type negative");
        else
            $display("PASS: I-Type negative");

        // S-Type immediate: +20
        instruction = 32'd0;
        instruction[6:0]   = 7'b0100011;
        instruction[31:25] = 7'b0000000;
        instruction[11:7]  = 5'b10100;
        #1;

        if (immediate !== 32'd20)
            $display("FAIL: S-Type");
        else
            $display("PASS: S-Type");

        // B-Type immediate: +16
        instruction = 32'd0;
        instruction[6:0]   = 7'b1100011;
        instruction[31]    = 1'b0;
        instruction[7]     = 1'b0;
        instruction[30:25] = 6'b000000;
        instruction[11:8]  = 4'b1000;
        #1;

        if (immediate !== 32'd16)
            $display("FAIL: B-Type");
        else
            $display("PASS: B-Type");

        // U-Type immediate
        instruction = 32'd0;
        instruction[6:0]   = 7'b0110111;
        instruction[31:12] = 20'h12345;
        #1;

        if (immediate !== 32'h12345000)
            $display("FAIL: U-Type");
        else
            $display("PASS: U-Type");

        // J-Type immediate: +32
        instruction = 32'd0;
        instruction[6:0]   = 7'b1101111;
        instruction[31]    = 1'b0;
        instruction[19:12] = 8'b00000000;
        instruction[20]    = 1'b0;
        instruction[30:21] = 10'b0000010000;
        #1;

        if (immediate !== 32'd32)
            $display("FAIL: J-Type");
        else
            $display("PASS: J-Type");

        // Unsupported opcode should return zero
        instruction = 32'd0;
        instruction[6:0] = 7'b1111111;
        #1;

        if (immediate !== 32'd0)
            $display("FAIL: default case");
        else
            $display("PASS: default case");

        $display("-----------------------------------------");
        $display("Immediate Generator verification complete");
        $display("-----------------------------------------");

        $stop;
    end

endmodule