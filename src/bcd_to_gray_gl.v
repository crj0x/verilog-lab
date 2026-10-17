module bcd_to_gray_gl (gray, bcd);
    output [3:0] gray;
    input [3:0] bcd;

    buf (gray[3], bcd[3]);
    xor (gray[2], bcd[3], bcd[2]);
    xor (gray[1], bcd[2], bcd[1]);
    xor (gray[0], bcd[1], bcd[0]);
endmodule
