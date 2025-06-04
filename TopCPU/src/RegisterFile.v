module RegisterFile (
    input clk,
    input we,
    input [4:0] ra1,
    input [4:0] ra2,
    input [4:0] wa,
    input [31:0] wd,
    output [31:0] rd1,
    output [31:0] rd2
);
    reg [31:0] regfile [0:31];

    assign rd1 = regfile[ra1];
    assign rd2 = regfile[ra2];

    always @(posedge clk) begin
        if (we) begin
            regfile[wa] <= wd;
        end
    end
endmodule

