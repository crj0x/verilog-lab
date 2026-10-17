module mag_comparator_4bit_beh (lt, gt, eq, a, b);
    output reg lt, gt, eq;
    input [3:0] a, b;

    always @(*) begin
        lt = 0;
        gt = 0;
        eq = 0;
        if (a < b)
            lt = 1;
        else if (a > b)
            gt = 1;
        else if (a == b)
            eq = 1;
    end
endmodule
