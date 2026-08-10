module de10_lite_top (

    input  wire        MAX10_CLK1_50,
    input  wire [1:0]  KEY,
    input  wire [9:0]  SW,

    output wire [9:0]  LEDR

);

    wire reset;
    wire cpu_clk;

    wire [31:0] pc;
    wire [31:0] instruction;

    reg [25:0] clock_counter;

    // KEY buttons are active-low.
    assign reset = ~KEY[0];

    // Slow clock divider:
    // bit 25 changes slowly enough to observe on LEDs.
    always @(posedge MAX10_CLK1_50 or posedge reset) begin
        if (reset)
            clock_counter <= 26'd0;
        else
            clock_counter <= clock_counter + 26'd1;
    end

    assign cpu_clk = clock_counter[25];

    riscv_cpu cpu_core (
        .clk         (cpu_clk),
        .reset       (reset),
        .pc          (pc),
        .instruction (instruction)
    );

    // Switch 0 selects what the LEDs display:
    // SW[0] = 0 → lower 10 bits of PC
    // SW[0] = 1 → lower 10 bits of current instruction
    assign LEDR =
        SW[0] ? instruction[9:0] :
                pc[9:0];

endmodule