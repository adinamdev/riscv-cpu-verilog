module alu(
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire [3:0]  alu_control,

    output reg  [31:0] result,
    output wire        zero
);

assign zero = (result == 32'd0);

always @(*) begin
    case (alu_control)

        // ADD
        4'b0000: result = a + b;

        // SUB
        4'b0001: result = a - b;

        // AND
        4'b0010: result = a & b;

        // OR
        4'b0011: result = a | b;

        // XOR
        4'b0100: result = a ^ b;

        // SLT - signed comparison
        4'b0101: result =
            ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;

        // SLL - logical left shift
        4'b0110: result = a << b[4:0];

        // SRL - logical right shift
        4'b0111: result = a >> b[4:0];

        default: result = 32'd0;

    endcase
end

endmodule
