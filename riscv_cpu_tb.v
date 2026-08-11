`timescale 1ns/1ps

module riscv_cpu_tb;

reg clk;
reg reset;

wire [31:0] pc;
wire [31:0] instruction;

integer errors;

riscv_cpu dut (
    .clk(clk),
    .reset(reset),
    .pc(pc),
    .instruction(instruction)
);

// 100 MHz simulation clock
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin
    errors = 0;

    // Apply reset
    reset = 1'b1;
    #15;
    reset = 1'b0;

    // Allow program to execute
    #200;

    $display("================================");
    $display("RISC-V CPU Verification Results");
    $display("================================");

    // Check register values
    if (dut.register_file_instance.registers[1] !== 32'd5) begin
        $display("FAIL: x1 = %0d, expected 5",
                 dut.register_file_instance.registers[1]);
        errors = errors + 1;
    end else begin
        $display("PASS: x1 = 5");
    end

    if (dut.register_file_instance.registers[2] !== 32'd3) begin
        $display("FAIL: x2 = %0d, expected 3",
                 dut.register_file_instance.registers[2]);
        errors = errors + 1;
    end else begin
        $display("PASS: x2 = 3");
    end

    if (dut.register_file_instance.registers[3] !== 32'd8) begin
        $display("FAIL: x3 = %0d, expected 8",
                 dut.register_file_instance.registers[3]);
        errors = errors + 1;
    end else begin
        $display("PASS: x3 = 8");
    end

    if (dut.register_file_instance.registers[4] !== 32'd8) begin
        $display("FAIL: x4 = %0d, expected 8",
                 dut.register_file_instance.registers[4]);
        errors = errors + 1;
    end else begin
        $display("PASS: x4 = 8");
    end

    if (dut.register_file_instance.registers[5] !== 32'd42) begin
        $display("FAIL: x5 = %0d, expected 42",
                 dut.register_file_instance.registers[5]);
        errors = errors + 1;
    end else begin
        $display("PASS: x5 = 42");
    end

    // Check memory write/read behavior
    if (dut.data_memory_instance.memory[0] !== 32'd8) begin
        $display("FAIL: Memory[0] = %0d, expected 8",
                 dut.data_memory_instance.memory[0]);
        errors = errors + 1;
    end else begin
        $display("PASS: Memory[0] = 8");
    end

    $display("--------------------------------");

    if (errors == 0)
        $display("ALL CPU TESTS PASSED");
    else
        $display("CPU TESTS FAILED: %0d error(s)", errors);

    $display("--------------------------------");

    $stop;
end

endmodule
