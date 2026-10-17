module mag_comparator_4bit_df (lt, gt, eq, a, b);
    output lt, gt, eq;
    input [3:0] a, b;

    assign lt = (a < b) ? 1 : 0;
    assign gt = (a > b) ? 1 : 0;
    assign eq = (a == b) ? 1 : 0;
endmodule
