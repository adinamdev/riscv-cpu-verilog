`timescale 1ns/1ps

module control_unit_tb;

    reg  [6:0] opcode;
    reg  [2:0] funct3;
    reg  [6:0] funct7;

    wire       reg_write;
    wire       alu_src;
    wire       mem_read;
    wire       mem_write;
    wire       mem_to_reg;
    wire       branch;
    wire [3:0] alu_control;

    control_unit dut (
        .opcode      (opcode),
        .funct3      (funct3),
        .funct7      (funct7),
        .reg_write   (reg_write),
        .alu_src     (alu_src),
        .mem_read    (mem_read),
        .mem_write   (mem_write),
        .mem_to_reg  (mem_to_reg),
        .branch      (branch),
        .alu_control (alu_control)
    );

    initial begin

        // R-Type ADD
        opcode = 7'b0110011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #1;

        if (reg_write !== 1'b1 ||
            alu_src !== 1'b0 ||
            alu_control !== 4'b0000)
            $display("FAIL: R-Type ADD");
        else
            $display("PASS: R-Type ADD");

        // R-Type SUB
        funct7 = 7'b0100000;
        #1;

        if (reg_write !== 1'b1 ||
            alu_src !== 1'b0 ||
            alu_control !== 4'b0001)
            $display("FAIL: R-Type SUB");
        else
            $display("PASS: R-Type SUB");

        // I-Type ADDI
        opcode = 7'b0010011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #1;

        if (reg_write !== 1'b1 ||
            alu_src !== 1'b1 ||
            alu_control !== 4'b0000)
            $display("FAIL: I-Type ADDI");
        else
            $display("PASS: I-Type ADDI");

        // LW
        opcode = 7'b0000011;
        funct3 = 3'b010;
        #1;

        if (reg_write  !== 1'b1 ||
            alu_src    !== 1'b1 ||
            mem_read   !== 1'b1 ||
            mem_write  !== 1'b0 ||
            mem_to_reg !== 1'b1 ||
            branch     !== 1'b0 ||
            alu_control !== 4'b0000)
            $display("FAIL: LW");
        else
            $display("PASS: LW");

        // SW
        opcode = 7'b0100011;
        funct3 = 3'b010;
        #1;

        if (reg_write  !== 1'b0 ||
            alu_src    !== 1'b1 ||
            mem_read   !== 1'b0 ||
            mem_write  !== 1'b1 ||
            mem_to_reg !== 1'b0 ||
            branch     !== 1'b0 ||
            alu_control !== 4'b0000)
            $display("FAIL: SW");
        else
            $display("PASS: SW");

        // BEQ
        opcode = 7'b1100011;
        funct3 = 3'b000;
        #1;

        if (reg_write  !== 1'b0 ||
            alu_src    !== 1'b0 ||
            mem_read   !== 1'b0 ||
            mem_write  !== 1'b0 ||
            branch     !== 1'b1 ||
            alu_control !== 4'b0001)
            $display("FAIL: BEQ");
        else
            $display("PASS: BEQ");

        // Unsupported opcode: safe defaults
        opcode = 7'b1111111;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #1;

        if (reg_write  !== 1'b0 ||
            mem_read   !== 1'b0 ||
            mem_write  !== 1'b0 ||
            branch     !== 1'b0)
            $display("FAIL: Safe defaults");
        else
            $display("PASS: Safe defaults");

        $display("----------------------------------");
        $display("Control Unit verification complete");
        $display("----------------------------------");

        $stop;
    end

endmodule