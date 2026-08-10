`timescale 1ns/1ps

module alu_tb;

    reg  [31:0] a;
    reg  [31:0] b;
    reg  [3:0]  alu_control;

    wire [31:0] result;
    wire zero;

    alu dut (

        .a(a),
        .b(b),
        .alu_control(alu_control),

        .result(result),
        .zero(zero)

    );

    initial begin

        // ADD
        a = 20;
        b = 5;
        alu_control = 4'b0000;
        #1;

        if(result != 25)
            $display("FAIL: ADD");
        else
            $display("PASS: ADD");

        // SUB
        alu_control = 4'b0001;
        #1;

        if(result != 15)
            $display("FAIL: SUB");
        else
            $display("PASS: SUB");

        // AND
        a = 8;
        b = 12;
        alu_control = 4'b0010;
        #1;

        if(result != (8 & 12))
            $display("FAIL: AND");
        else
            $display("PASS: AND");

        // OR
        alu_control = 4'b0011;
        #1;

        if(result != (8 | 12))
            $display("FAIL: OR");
        else
            $display("PASS: OR");

        // XOR
        alu_control = 4'b0100;
        #1;

        if(result != (8 ^ 12))
            $display("FAIL: XOR");
        else
            $display("PASS: XOR");

        // SLT
        a = 3;
        b = 10;
        alu_control = 4'b0101;
        #1;

        if(result != 1)
            $display("FAIL: SLT");
        else
            $display("PASS: SLT");

        // SLL
        a = 2;
        b = 3;
        alu_control = 4'b0110;
        #1;

        if(result != 16)
            $display("FAIL: SLL");
        else
            $display("PASS: SLL");

        // SRL
        a = 16;
        b = 2;
        alu_control = 4'b0111;
        #1;

        if(result != 4)
            $display("FAIL: SRL");
        else
            $display("PASS: SRL");

        // ZERO FLAG
        a = 5;
        b = 5;
        alu_control = 4'b0001;
        #1;

        if(zero != 1)
            $display("FAIL: ZERO FLAG");
        else
            $display("PASS: ZERO FLAG");

        $display("-------------------------");
        $display("ALU verification complete");
        $display("-------------------------");

        $stop;

    end

endmodule