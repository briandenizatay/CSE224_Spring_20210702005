module InstructionMemory (
    input [4:0] pc,
    output reg [31:0] instruction
);
    always @(*) begin
        case (pc)
            5'd0: instruction = 32'b0101_01010_00000_00000_000000001010;
            5'd1: instruction = 32'b0101_01111_00000_00000_000000001111;
            5'd2: instruction = 32'b0001_11001_01010_01111_000000000000;
            5'd3: instruction = 32'b0110_10100_11001_00000_000000000101;
            5'd4: instruction = 32'b0101_00101_00000_00000_000000000010;
            5'd5: instruction = 32'b0011_11110_11001_00101_000000000000;
            default: instruction = 32'b00000000000000000000000000000000;
        endcase
    end
endmodule
