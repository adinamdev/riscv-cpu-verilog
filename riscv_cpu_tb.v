`timescale 1ns/1ps

module riscv_cpu_tb;

    reg clk;
    reg reset;

    wire [31:0] pc;
    wire [31:0] instruction;

    riscv_cpu dut (

        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instruction(instruction)

    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        reset = 1;

        #15;

        reset = 0;

        // Run long enough for all instructions
        #200;

        $display("--------------------------------");
        $display("CPU Simulation Complete");
        $display("--------------------------------");

        $display("PC  = %d", pc);

        $display("x1 = %d", dut.register_file_instance.registers[1]);
        $display("x2 = %d", dut.register_file_instance.registers[2]);
        $display("x3 = %d", dut.register_file_instance.registers[3]);
        $display("x4 = %d", dut.register_file_instance.registers[4]);
        $display("x5 = %d", dut.register_file_instance.registers[5]);

        $display("Memory[0] = %d",
                 dut.data_memory_instance.memory[0]);

        $stop;

    end

endmodule