module tb_full_adder;
    reg a, b, cin;
    wire cout, s;

    reg expected_cout, expected_s;

    // full_adder_df dut (cout, s, a, b, cin);
    full_adder_gl dut (cout, s, a, b, cin);

    integer i, j, k;

    initial begin
        for (i = 0; i < 2; i++) begin
            for (j = 0; j < 2; j++) begin
                for (k = 0; k < 2; k++) begin
                    a = i;
                    b = j;
                    cin = k;
                    {expected_cout, expected_s} = a + b + cin;

                    #5;

                    if ({expected_cout, expected_s} !== {cout, s})
                        $display("FAIL: a=%b, b=%b, cin=%b, cout=%b, s=%b", a, b, cin, cout, s);
                    else
                        $display("PASS: a=%b, b=%b, cin=%b, cout=%b, s=%b", a, b, cin, cout, s);
                end
            end
        end
        $finish;
    end

    initial begin
        $dumpfile("tb_full_adder.vcd");
        $dumpvars;
    end
endmodule
