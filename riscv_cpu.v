module riscv_cpu (

    input  wire        clk,
    input  wire        reset,

    output wire [31:0] pc,
    output wire [31:0] instruction

);

    // Instruction fields
    wire [6:0] opcode;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;
    wire [2:0] funct3;
    wire [6:0] funct7;

    // Datapath signals
    wire [31:0] next_pc;
    wire [31:0] immediate;
    wire [31:0] read_data1;
    wire [31:0] read_data2;
    wire [31:0] alu_operand_b;
    wire [31:0] alu_result;
    wire [31:0] memory_read_data;
    wire [31:0] write_back_data;

    // Control signals
    wire       reg_write;
    wire       alu_src;
    wire       mem_read;
    wire       mem_write;
    wire       mem_to_reg;
    wire       branch;
    wire [3:0] alu_control;

    // Branch signals
    wire zero;
    wire branch_taken;

    // Extract instruction fields
    assign opcode = instruction[6:0];
    assign rd     = instruction[11:7];
    assign funct3 = instruction[14:12];
    assign rs1    = instruction[19:15];
    assign rs2    = instruction[24:20];
    assign funct7 = instruction[31:25];

    // Datapath multiplexers
    assign alu_operand_b  = alu_src ? immediate : read_data2;
    assign write_back_data = mem_to_reg ? memory_read_data : alu_result;

    // Branch and next-PC logic
    assign branch_taken = branch && zero;
    assign next_pc =
        branch_taken ? (pc + immediate) :
                       (pc + 32'd4);

    program_counter pc_unit (
        .clk     (clk),
        .reset   (reset),
        .next_pc (next_pc),
        .pc      (pc)
    );

    instruction_memory instruction_memory_unit (
        .address     (pc),
        .instruction (instruction)
    );

    control_unit control_unit_instance (
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

    register_file register_file_instance (
        .clk        (clk),
        .reg_write  (reg_write),
        .rs1        (rs1),
        .rs2        (rs2),
        .rd         (rd),
        .write_data (write_back_data),
        .read_data1 (read_data1),
        .read_data2 (read_data2)
    );

    immediate_generator immediate_generator_instance (
        .instruction (instruction),
        .immediate   (immediate)
    );

    alu alu_instance (
        .a           (read_data1),
        .b           (alu_operand_b),
        .alu_control (alu_control),
        .result      (alu_result),
        .zero        (zero)
    );

    data_memory data_memory_instance (
        .clk        (clk),
        .mem_read   (mem_read),
        .mem_write  (mem_write),
        .address    (alu_result),
        .write_data (read_data2),
        .read_data  (memory_read_data)
    );

endmodule