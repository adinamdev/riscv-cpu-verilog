module instruction_memory (
    input  wire [31:0] address,
    output wire [31:0] instruction
);

    reg [31:0] memory [0:255];

    initial begin
        // Test program
        memory[0] = 32'h00500093; // addi x1, x0, 5
        memory[1] = 32'h00300113; // addi x2, x0, 3
        memory[2] = 32'h002081B3; // add  x3, x1, x2
        memory[3] = 32'h00302023; // sw   x3, 0(x0)
        memory[4] = 32'h00002203; // lw   x4, 0(x0)
        memory[5] = 32'h00418463; // beq  x3, x4, +8
        memory[6] = 32'h06300293; // addi x5, x0, 99 — skipped
        memory[7] = 32'h02A00293; // addi x5, x0, 42
        memory[8] = 32'h00000013; // nop
    end

    assign instruction = memory[address[9:2]];

endmodule