module InstructionDecoder (
    input [31:0] instruction,
    output reg [2:0] ALUop,
    output reg [4:0] rd,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [31:0] immediate,
    output reg isImmediateOp
);
    always @(*) begin
        rd = instruction[27:23];
        rs1 = instruction[22:18];
        rs2 = instruction[17:13];
        immediate = {{19{instruction[12]}}, instruction[12:0]}; // sign-extend
        ALUop = 3'b000;
        isImmediateOp = 0;

        case (instruction[31:28])
            4'b0000: ALUop = 3'b000; // NOOP
            4'b0001: ALUop = 3'b010; // ADD
            4'b0010: ALUop = 3'b011; // SUB
            4'b0011: ALUop = 3'b100; // SHIFTL
            4'b0100: ALUop = 3'b101; // SHIFTR
            4'b0101: begin ALUop = 3'b110; isImmediateOp = 1; end // ADDI
            4'b0110: begin ALUop = 3'b111; isImmediateOp = 1; end // SUBI
            default: ALUop = 3'b000; // NOOP
        endcase
    end
endmodule

