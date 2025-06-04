module TopCPU (
    input clk,
    input reset,
    input control,
    output [3:0] an,
    output [6:0] seg
);
    wire [31:0] Result;
    reg [4:0] pc;
    wire [31:0] instruction;
    wire [2:0] ALUop;
    wire [4:0] rd, rs1, rs2;
    wire [31:0] immediate;
    wire isImmediateOp;
    wire [31:0] A, B;
    reg [31:0] B_input;
    reg we;

    InstructionMemory imem(pc, instruction);
    InstructionDecoder decoder(instruction, ALUop, rd, rs1, rs2, immediate, isImmediateOp);
    RegisterFile regfile(clk, we, rs1, rs2, rd, Result, A, B);
    ALU alu(A, B_input, ALUop, Result);

    assign an = 4'b0000; // Default dummy output
    assign seg = Result[6:0]; // Output lower 7 bits of Result

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 0;
        else if (control)
            pc <= pc + 1;
    end

    always @(*) begin
        B_input = isImmediateOp ? immediate : B;
        we = (ALUop != 3'b000 && rd != 5'd0);
    end
endmodule
