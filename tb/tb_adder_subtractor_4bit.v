module tb_adder_subtractor_4bit;
    reg [3:0] a, b;
    reg sel;
    wire cout;
    wire [3:0] s;

    reg expected_cout;
    reg [3:0] expected_s;

    adder_subtractor_4bit dut (cout, s, a, b, sel);

    integer i, j, k;

    initial begin
        for (i = 0; i < 16; i++) begin
            for (j = 0; j < 16; j++) begin
                for (k = 0; k < 2; k++) begin
                    a = i;
                    b = j;
                    sel = k;
                    if (sel == 0) begin
                        {expected_cout, expected_s} = {1'b0, a} + {1'b0, b};
                    end
                    else begin
                        expected_s = a - b;
                        expected_cout = a >= b;
                    end

                    #5;

                    if ({expected_cout, expected_s} !== {cout, s})
                        $display("FAIL: a=%b, b=%b, cout=%b, s=%b, sel=%b", a, b, cout, s, sel);
                    else
                        $display("PASS: a=%b, b=%b, cout=%b, s=%b, sel=%b", a, b, cout, s, sel);
                end
            end
        end
        $finish;
    end

    initial begin
        $dumpfile("tb_adder_subtractor_4bit.vcd");
        $dumpvars;
    end
endmodule
