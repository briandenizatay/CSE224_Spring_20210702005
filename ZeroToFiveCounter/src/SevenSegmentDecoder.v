module SevenSegmentDecoder(
    input [3:0] digit,
    output reg [6:0] seg
);

always @(*) begin
    case (digit)
        4'd0: seg = 7'b1000000;
    4'd1: seg = 7'b1111001;
    4'd2: seg = 7'b0100100;
    4'd3: seg = 7'b0110000;
    4'd4: seg = 7'b0011001;
    4'd5: seg = 7'b0010010;
        default: seg = 7'b1111111; // blank display
    endcase
end

endmodule
