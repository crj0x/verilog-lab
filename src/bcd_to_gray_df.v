module bcd_to_gray_df (gray, bcd);
    output [3:0] gray;
    input [3:0] bcd;

    assign gray = bcd ^ (bcd >> 1);
endmodule
