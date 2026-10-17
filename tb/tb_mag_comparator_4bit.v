module tb_mag_comparator_4bit;
    reg [3:0] a, b;
    wire lt, gt, eq;

    reg expected_lt, expected_gt, expected_eq;

    // mag_comparator_4bit_beh dut (lt, gt, eq, a, b);
    // mag_comparator_4bit_df dut (lt, gt, eq, a, b);
    mag_comparator_4bit_gl dut (lt, gt, eq, a, b);

    integer i, j;
    integer n_errors;

    initial begin
        n_errors = 0;
        for (i = 0; i < 16; i++) begin
            for (j = 0; j < 16; j++) begin
                a = i;
                b = j;
                expected_lt = (a < b);
                expected_gt = (a > b);
                expected_eq = (a == b);

                #5;

                if (lt !== expected_lt || gt !== expected_gt || eq !== expected_eq) begin
                    $display("FAIL: a=%b, b=%b, lt=%b, gt=%b, eq=%b", a, b, lt, gt, eq);
                    n_errors++;
                end
                else begin
                    $display("PASS: a=%b, b=%b, lt=%b, gt=%b, eq=%b", a, b, lt, gt, eq);
                end
            end
        end
        $display("No. of FAILED test cases: %0d", n_errors);
        $finish;
    end

    initial begin
        $dumpfile("tb_mag_comparator_4bit.vcd");
        $dumpvars;
    end
endmodule
