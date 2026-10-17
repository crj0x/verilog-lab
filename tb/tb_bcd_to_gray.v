module tb_bcd_to_gray;
    reg [3:0] bcd;
    wire [3:0] gray;

    reg [3:0] expected_gray;

    // bcd_to_gray_df dut (gray, bcd);
    bcd_to_gray_gl dut (gray, bcd);

    integer i;

    initial begin
        for (i = 0; i < 10; i++) begin
            bcd = i;
            expected_gray = i ^ (i >> 1);

            #5;

            if (gray !== expected_gray)
                $display("FAIL: bcd=%b, gray=%b, expected_gray=%b", bcd, gray, expected_gray);
            else
                $display("PASS: bcd=%b, gray=%b, expected_gray=%b", bcd, gray, expected_gray);
        end
        $finish;
    end

    initial begin
        $dumpfile("tb_bcd_to_gray.vcd");
        $dumpvars;
    end
endmodule
